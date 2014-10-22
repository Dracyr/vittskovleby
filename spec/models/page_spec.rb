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

  it "is invalid without a permalink" do
    page = FactoryGirl.build(:page, title: "")
    expect(page).to be_invalid
  end

  it "is invalid when permalink is a reserved name" do
    page = FactoryGirl.build(:page, title: "users")
    expect(page).to be_invalid
  end

  it "creates a permalink" do
    page = FactoryGirl.create(:page, title: "Some text right here")
    expect(page.permalink).to eq(page.title.parameterize)
  end

  it "does not allow duplicate titles" do
    FactoryGirl.create(:page, title: "Page title")
    page = FactoryGirl.build(:page, title: "Page title")
    expect(page).to be_invalid
  end

  describe "orphans" do
    let(:menu) { FactoryGirl.create(:menu) }
    let(:page) { FactoryGirl.create(:page, menu: menu) }
    let(:other_page) { FactoryGirl.create(:page) }

    it "should include parent page" do
      expect(Page.orphans).to include(other_page)
    end

    it "should not include children" do
      expect(Page.orphans).to_not include(page)
    end
  end
end
