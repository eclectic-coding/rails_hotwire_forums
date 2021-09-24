require "rails_helper"

RSpec.describe "Discussions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/discussions/index"
      expect(response).to have_http_status(:success)
    end
  end
end
