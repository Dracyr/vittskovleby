require 'spec_helper'

describe User do
  context "is invalid" do
    it "with duplicate email" do
      FactoryGirl.create(:user, email: "same@example.com")
      user = FactoryGirl.build(:user, email: "same@example.com")
      expect(user).to be_invalid
    end

    it "with a short password" do
      user = FactoryGirl.build(:user, password: "test", password_confirmation: "test")
      expect(user).to be_invalid
    end

    it "without a role" do
      user = FactoryGirl.build(:user, role: nil)
      expect(user).to be_invalid
    end
  end
end
