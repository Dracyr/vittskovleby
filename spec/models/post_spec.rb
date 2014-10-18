require 'spec_helper'

describe Post do
  it "has a valid factory" do
    post = FactoryGirl.build(:post)
    expect(post).to be_valid
  end

  it "is invalid without a title" do
    post = FactoryGirl.build(:post, title: "")
    expect(post).to be_invalid
  end

  it "is invalid without content" do
    post = FactoryGirl.build(:post, content: "")
    expect(post).to be_invalid
  end
end
