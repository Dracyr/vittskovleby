require 'spec_helper'

describe User do

  it "has a valid factory" do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  it "does not allow duplicate email" do
    FactoryGirl.create(:user, email: "same@example.com")
    user = FactoryGirl.build(:user, email: "same@example.com")
    expect(user).to be_invalid
  end

  it "does not allow short passwords" do
    user = FactoryGirl.build(:user, password: "test", password_confirmation: "test")
    expect(user).to be_invalid
  end
end
