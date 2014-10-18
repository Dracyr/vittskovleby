require "spec_helper"

feature "When user creates a page:" do
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

feature "When user visits page index" do
  let!(:user) { sign_in FactoryGirl.create(:user) }
  let!(:parent_page) { FactoryGirl.create(:page_with_children) }

  before(:each) { visit pages_path }

  scenario "it does not have errors" do
    expect(page).to have_text "Pages"
  end

  scenario "it should show the pages" do
    expect(page).to have_text parent_page.title
  end

  scenario "he can destroy pages" do
    expect { first('.dd3-content').click_on('Delete') }.to change { Page.count }.by(-1)
  end

  scenario "he can edit pages" do
    first('.dd3-content').click_link 'Edit'
    fill_form :page, {title: "Page title", content: "Page content"}
    click_on submit(:page, :update)
    expect(page).to have_text "Page was successfully updated."
  end

  scenario "he can create child page" do
    find(:xpath, "//li[@data-id='#{parent_page.id}']").click_on 'Create child'

    fill_form :page, {title: "Child page", content: "Page content"}
    click_on submit(:page)

    visit pages_path
    within(:xpath, "//li[@data-id='#{parent_page.id}']") do
      expect(page).to have_text "Child page"
    end
  end
end
