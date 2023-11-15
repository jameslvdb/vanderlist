require "rails_helper"

RSpec.describe "Sessions", type: :request do
  fdescribe "GET /new" do
    fit "returns http success" do
      get "/session/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/session/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/session/destroy"
      expect(response).to have_http_status(:success)
    end
  end
end
