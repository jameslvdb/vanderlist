require "rails_helper"

RSpec.describe "Registrations", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/registration/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates a User" do
      expect {
        post "/registration", params: {
          user: {
            email: "user@example.com",
            password: "password",
            password_confirmation: "password"
          }
        }
      }.to change { User.count }.by(1)

      expect(response).to redirect_to(root_path)
      expect(response).to have_http_status(:redirect)
      follow_redirect!
      expect(response.body).to include("You have successfully registered.")
      expect(response).to have_http_status(:success)
    end
  end
end
