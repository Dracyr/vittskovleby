require "spec_helper"

feature "User creates a page" do
  scenario "they see the page" do
    visit new_page_path

    fill_form :page, {title: "Page title", content: "Page content"}
    click_on submit(:page)

    expect(page).to have_text "Page created successfully"
  end
end
