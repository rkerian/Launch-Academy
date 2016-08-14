require "rails_helper"

feature "fortunes" do
  scenario "user visits /fortunes path" do
    fortunes = create_list(:fortune, 5)
    visit fortunes_path
    fortunes.each do |fortune|
      expect(page).to have_content(fortune.content)
    end
  end
end
