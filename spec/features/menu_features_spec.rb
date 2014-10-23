require "spec_helper"

feature "Menu management:" do
  let!(:user) { sign_in FactoryGirl.create(:user) }
  let(:menu)  { FactoryGirl.create(:menu) }

  scenario "can create menu" do
    visit new_menu_path

    fill_form :menu, attributes_for(:menu)
    click_on submit(:menu)

    expect(page).to have_text "Menu was successfully created."
  end

  scenario "can edit menu" do
    visit edit_menu_path(menu)

    fill_form(:menu, title: "New Title")
    click_on submit(:menu, :update)

    expect(page).to have_text "Menu was successfully updated."
  end
end

feature "Unauthorized users" do
  let(:menu) { FactoryGirl.create(:menu) }

  scenario "cannot create menus" do
    visit new_menu_path
    expect(page).to have_text "You are not authorized to access this page."
  end

  scenario "cannot edit menus" do
    visit edit_menu_path(menu)
    expect(page).to have_text "You are not authorized to access this page."
  end
end
