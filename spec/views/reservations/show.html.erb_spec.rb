require 'spec_helper'

RSpec.describe "reservations/show", :type => :view do
  before(:each) do
    @reservation = assign(:reservation, Reservation.create!(
      :location => "Location",
      :name => "Name",
      :phone => "Phone",
      :email => "Email",
      :comment => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/MyText/)
  end
end
