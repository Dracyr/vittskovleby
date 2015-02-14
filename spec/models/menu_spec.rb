require 'spec_helper'

describe Menu do
  it "is invalid without a title" do
    menu = FactoryGirl.build(:menu, title: "")
    expect(menu).to be_invalid
  end
end
