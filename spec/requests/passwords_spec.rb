require "rails_helper"

RSpec.describe "Passwords", type: :request do
  describe "GET /edit" do
    it "returns http success" do
      get "/password/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/password/update"
      expect(response).to have_http_status(:success)
    end
  end
end
