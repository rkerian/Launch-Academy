require "rails_helper"

feature "view fortune" do
  scenario "user sees a fortune at root path" do
    fortune = create(:fortune)
    visit root_path
    expect(page).to have_content(fortune.content)
  end
end
