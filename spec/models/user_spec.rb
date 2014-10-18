require 'spec_helper'

describe User do
  it "does not allow duplicate email" do
    FactoryGirl.create(:user, email: "same@example.com")
    user = FactoryGirl.build(:user, email: "same@example.com")
    expect(user).to be_invalid
  end

  it "does not allow short passwords" do
    user = FactoryGirl.build(:user, password: "test", password_confirmation: "test")
    expect(user).to be_invalid
  end

  it "is not valid without a role" do
    user = FactoryGirl.build(:user, role: nil)
    expect(user).to be_invalid
  end
end
