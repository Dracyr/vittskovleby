require "spec_helper"

feature "Page management," do
  let(:user) { FactoryGirl.create(:user) }
  let(:this_page) { FactoryGirl.create(:page) }

  scenario "can create pages" do
    sign_in user
    visit new_page_path

    fill_form :page, {title: "Page title", content: "Page content"}
    click_on submit(:page)

    expect(page).to have_text "Page was successfully created."
  end

  scenario "can edit pages" do
    sign_in user
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

feature "When user visits page index," do
  let!(:user) { sign_in FactoryGirl.create(:user) }

  scenario "it does not have errors" do
    visit pages_path
    expect(page).to have_text "Pages"
  end

  scenario "he can destroy pages" do
    FactoryGirl.create(:page)
    visit pages_path
    expect { find_parent(".glyphicon-trash").click }.to change { Page.count }.by(-1)
  end

  scenario "he can create child page" do
    FactoryGirl.create(:menu)
    visit pages_path

    find_parent(".glyphicon-plus-sign").click

    fill_form :page, {title: "Child page", content: "Page content"}
    click_on submit(:page)

    visit pages_path
    expect(page).to have_text "Child page"
  end
end
