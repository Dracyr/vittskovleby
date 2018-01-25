class Menu < ApplicationRecord
  include CacheKey

  belongs_to :page
  belongs_to :parent,    class_name: 'Menu', touch: true
  has_many   :children,  class_name: 'Menu', foreign_key: 'parent_id'

  default_scope -> { order('position ASC') }
  scope :orphans, -> { where(parent: nil) }

  validate :title_or_page?
  validate :page_if_page?
  validate :prefix_if_link?

  acts_as_list scope: :parent

  enum menu_type: [:menu, :page, :link]

  def self.update_order!(menus)
    update_order(menus)
  end

  def title
    menu_type == 'page' ? page.title : self[:title]
  end

  def link
    menu_type == 'page' ? page.permalink : self[:link]
  end

  private

  def page_if_page?
    return unless menu_type == 'page' && page_id.blank?
    errors.add(:page_id, I18n.t('activerecord.errors.models.menu.attributes.page.should_have_page'))
  end

  def title_or_page?
    return unless menu_type != 'page' && self[:title].blank?
    errors.add(:page_id, I18n.t('activerecord.errors.models.menu.attributes.page.should_have_page_or_title'))
    errors.add(:title,   I18n.t('activerecord.errors.models.menu.attributes.title.should_have_page_or_title'))
  end

  def prefix_if_link?
    return unless menu_type == 'link' && !link.include?('http') && !link.include?('/')
    errors.add(:link, I18n.t('activerecord.errors.models.menu.attributes.link.should_have_prefix'))
  end

  def self.update_order(menus, parent_id = nil)
    menus.each_with_index do |child, index|
      Menu.update(child['id'], parent_id: parent_id, position: index + 1)
      update_order(child['children'], child['id']) if child['children']
    end
  end
end
