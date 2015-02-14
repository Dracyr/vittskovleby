require "spec_helper"

feature "User creates a event:", broken: true do
  login_admin

  scenario "they see the event" do
    visit new_event_path

    fill_form :event, {title: "event title", content: "event content", date: "2014-01-01"}
    click_on submit(:event)

    expect(page).to have_text "event was successfully created."
  end

  scenario "a regular user is not allowed" do
    visit new_event_path
    expect(page).to have_text "You are not authorized to access this page."
  end
end
