require 'spec_helper'

describe Event do
  it "is invalid without a title" do
    post = FactoryGirl.build(:event, title: "")
    expect(post).to be_invalid
  end

  it "is invalid without content" do
    post = FactoryGirl.build(:event, content: "")
    expect(post).to be_invalid
  end
end
