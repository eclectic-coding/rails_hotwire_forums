require "rails_helper"

RSpec.describe "CreateDiscussions", type: :system do
  before do
    login_as(create(:user))
  end

  def fill_in_trix_editor(id, with:)
    find(:css, "##{id}").click.set(with)
  end

  describe "Create discussion" do
    it "Create a new discussion" do
      category = create(:category)
      visit discussions_path
      click_on "New Discussion"
      fill_in "Name", with: "Hello World"
      select category, from: "Choose a category"
      # Add post body
      find(:css, "#discussion_post_attributes")
      fill_in_rich_text_area "page_content", with: "Some content."
      click_on "Create Discussion"

      visit discussions_path
      expect(page).to have_content("Hello World")

    end

  end
end
