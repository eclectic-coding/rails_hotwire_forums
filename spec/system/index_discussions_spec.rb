require "rails_helper"

RSpec.describe "IndexDiscussions", type: :system do
  before do
    login_as(create(:user))
  end

  scenario "list discussions" do
    visit discussions_path
    click
  end
end
