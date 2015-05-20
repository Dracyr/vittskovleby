require 'spec_helper'

describe Menu do
  context "is invalid" do
    it "without a link prefix when type is link" do
      menu = build(:menu, menu_type: :link, link: '')
      expect(menu).to be_invalid
    end

    it "without a page when type is page" do
      menu = build(:menu, menu_type: :page, page: nil)
      expect(menu).to be_invalid
    end

    it "without a title when type is not page" do
      menu = build(:menu, menu_type: :menu, title: nil)
      expect(menu).to be_invalid
    end
  end

  context "when type is page" do
    let(:page) { build(:page) }
    let(:menu) { build(:menu, menu_type: :page, page: page) }

    it 'return page title' do
      expect(menu.title).to eq(page.title)
    end

    it 'return page link' do
      expect(menu.link).to eq(page.permalink)
    end
  end

  context "when type is not page" do
    let(:menu) { build(:menu, title: 'This title', link: '/test') }

    it 'return title' do
      expect(menu.title).to eq('This title')
    end

    it 'return link' do
      expect(menu.link).to eq('/test')
    end
  end
end
