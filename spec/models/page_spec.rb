require 'spec_helper'

describe Page do
  context "is invalid" do
    it "without a title" do
      page = build(:page, title: "")
      expect(page).to be_invalid
    end

    it "without content" do
      page = build(:page, content: "")
      expect(page).to be_invalid
    end

    it "without a permalink" do
      page = build(:page, title: "")
      expect(page).to be_invalid
    end

    it "when permalink is a reserved name" do
      page = build(:page, title: "users")
      expect(page).to be_invalid
    end

    it "with a duplicate title" do
      create(:page, title: "Page title")
      page = build(:page, title: "Page title")
      expect(page).to be_invalid
    end
  end

  context ".permalink" do
    it "exists" do
      page = create(:page, title: "Some text right here")
      expect(page.permalink).to eq(page.title.parameterize)
    end
  end

  describe "orphans" do
    let(:menu) { create(:menu) }
    let(:page) { create(:page, menu: menu) }
    let(:other_page) { create(:page) }

    it "includes children" do
      expect(Page.orphans).to include(other_page)
    end

    it "doesn't include a parent page" do
      expect(Page.orphans).to_not include(page)
    end
  end
end
