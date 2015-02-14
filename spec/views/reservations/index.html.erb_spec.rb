require 'spec_helper'

RSpec.describe "reservations/index", :type => :view do
  before(:each) do
    assign(:reservations, [
      Reservation.create!(
        :location => "Location",
        :name => "Name",
        :phone => "Phone",
        :email => "Email",
        :comment => "MyText"
      ),
      Reservation.create!(
        :location => "Location",
        :name => "Name",
        :phone => "Phone",
        :email => "Email",
        :comment => "MyText"
      )
    ])
  end

  it "renders a list of reservations" do
    render
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
