require "spec_helper"

feature "Menu management:", broken: true do
  let(:menu)  { FactoryGirl.create(:menu) }

  scenario "can create menu" do
    login_user
    visit new_menu_path

    fill_form :menu, attributes_for(:menu)
    click_on submit(:menu)

    expect(page).to have_text "Menu was successfully created."
  end

  scenario "can edit menu" do
    login_user
    visit edit_menu_path(menu)

    fill_form(:menu, title: "New Title")
    click_on submit(:menu, :update)

    expect(page).to have_text "Menu was successfully updated."
  end
end

feature "Unauthorized users", broken: true do
  let(:menu) { FactoryGirl.create(:menu) }

  scenario "cannot create menus" do
    visit new_menu_path
    expect(page).to redirect_to(root_url)
  end

  scenario "cannot edit menus" do
    visit edit_menu_path(menu)
    expect(page).to redirect_to(root_url)
  end
end
