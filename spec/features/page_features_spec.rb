require "spec_helper"

feature "User creates a page:" do
  let(:user) { FactoryGirl.create(:user) }

  scenario "they see the page" do
    sign_in user
    visit new_page_path

    fill_form :page, {title: "Page title", content: "Page content"}
    click_on submit(:page)

    expect(page).to have_text "Page was successfully created."
  end

  scenario "a regular user is not allowed" do
    visit new_page_path
    expect(page).to have_text "You are not authorized to access this page."
  end
end
