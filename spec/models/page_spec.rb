require 'spec_helper'

describe Page do
  it "has a valid factory" do
    page = FactoryGirl.build(:page)
    expect(page).to be_valid
  end

  it "is invalid without a title" do
    page = FactoryGirl.build(:page, title: "")
    expect(page).to be_invalid
  end

  it "is invalid without content" do
    page = FactoryGirl.build(:page, content: "")
    expect(page).to be_invalid
  end

  it "does not allow duplicate titles" do
    FactoryGirl.create(:page)
    page = FactoryGirl.build(:page)
    expect(page).to be_invalid
  end
end
