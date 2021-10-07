require "rails_helper"

RSpec.describe "Discussions", type: :request do
  before do
    login_as(create(:user))
  end

  describe "GET /index" do
    it "returns http success" do
      get discussions_path
      expect(response).to have_http_status(:success)
    end
  end
end
