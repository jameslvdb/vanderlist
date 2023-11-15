require "rails_helper"

RSpec.describe "Sessions", type: :request do
  describe "GET /new" do
    it "successfully renders the login form" do
      get "/session/new"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Log in")
    end
  end

  describe "sessions#create (logging in)" do
    it "successfully logs in with correct credentials" do
      create(:user, email: "user@example.com", password: "password")
      post "/session", params: {email: "user@example.com", password: "password"}
      expect(response).to redirect_to(root_path)
      expect(response).to have_http_status(:redirect)
      follow_redirect!
      expect(response.body).to include("You have been logged in successfully.")
    end

    it "does not log in with incorrect credentials" do
      create(:user, email: "user@example.com", password: "password")
      post "/session", params: {email: "user@example.com", password: "wrongpassword"}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.body).to include("Invalid email or password.")
    end
  end

  describe "sessions#destroy (logging out)" do
    it "returns http success" do
      user = create(:user)
      Current.user = user
      expect(Current.user).to eq(user)
      delete "/session"
      expect(Current.user).to be_nil
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(root_path)
      follow_redirect!
      expect(response.body).to include("You have been logged out successfully.")
    end
  end
end
