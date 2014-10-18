require 'spec_helper'

describe Page do
  it "is invalid without a title" do
    page = FactoryGirl.build(:page, title: "")
    expect(page).to be_invalid
  end

  it "is invalid without content" do
    page = FactoryGirl.build(:page, content: "")
    expect(page).to be_invalid
  end

  it "does not allow duplicate titles" do
    FactoryGirl.create(:page, title: "Page title")
    page = FactoryGirl.build(:page, title: "Page title")
    expect(page).to be_invalid
  end

  describe "orphans" do
    let(:parent_page) { FactoryGirl.create(:page_with_children) }

    it "should include parent page" do
      expect(Page.orphans).to include(parent_page)
    end

    it "should not include children" do
      expect(Page.orphans).to_not include(parent_page.children.first)
    end
  end
end
