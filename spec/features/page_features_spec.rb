require "spec_helper"

feature "Page management,", broken: true do
  let(:this_page) { FactoryBot.create(:page) }

  scenario "can create pages" do
    login_user
    visit new_page_path

    fill_form :page, {title: "Page title", content: "Page content"}
    click_on submit(:page)

    expect(page).to have_text "Page was successfully created."
  end

  scenario "can edit pages" do
    login_user
    visit edit_page_path(this_page)

    fill_form :page, {title: "Page title", content: "Page content"}
    click_on submit(:page, :update)

    expect(page).to have_text "Page was successfully updated."
  end

  scenario "a regular user is not allowed" do
    visit new_page_path
    expect(page).to have_text "You are not authorized to access this page."
  end
end

feature "When user visits page index,", broken: true do

  scenario "it does not have errors" do
    login_user
    visit pages_path
    expect(page).to have_text "Pages"
  end

  scenario "he can destroy pages" do
    login_user
    FactoryBot.create(:page)
    visit pages_path
    expect { find_parent(".glyphicon-trash").click }.to change { Page.count }.by(-1)
  end
end
