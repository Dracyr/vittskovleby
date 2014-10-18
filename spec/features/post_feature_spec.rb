require "spec_helper"

feature "User creates a post:" do
  let(:user) { FactoryGirl.create(:user) }

  scenario "they see the post" do
    sign_in user
    visit new_post_path

    fill_form :post, {title: "Post title", content: "Post content"}
    click_on submit(:post)

    expect(page).to have_text "Post was successfully created."
  end

  scenario "a regular user is not allowed" do
    visit new_post_path
    expect(page).to have_text "You are not authorized to access this page."
  end
end
