require 'spec_helper'

RSpec.describe "reservations/edit", :type => :view do
  before(:each) do
    @reservation = assign(:reservation, Reservation.create!(
      :location => "MyString",
      :name => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :comment => "MyText"
    ))
  end

  it "renders the edit reservation form" do
    render

    assert_select "form[action=?][method=?]", reservation_path(@reservation), "post" do

      assert_select "input#reservation_location[name=?]", "reservation[location]"

      assert_select "input#reservation_name[name=?]", "reservation[name]"

      assert_select "input#reservation_phone[name=?]", "reservation[phone]"

      assert_select "input#reservation_email[name=?]", "reservation[email]"

      assert_select "textarea#reservation_comment[name=?]", "reservation[comment]"
    end
  end
end
