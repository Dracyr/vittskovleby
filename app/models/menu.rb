class Menu < ActiveRecord::Base
  has_many   :children,  class_name: 'Menu', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Menu'
  acts_as_list scope: :parent

  validate :has_title_or_page
  validate :has_page_if_page
  validate :has_prefix_if_link

  belongs_to :page

  default_scope -> { order("position ASC") }
  scope :orphans, -> { where(parent: nil) }

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

  def has_page_if_page
    if menu_type == 'page' && page_id.blank?
      errors.add(:base, I18n.t('errors.messages.should_have_page'))
    end
  end

  def has_title_or_page
    if menu_type != 'page' && self[:title].blank?
      errors.add(:base, I18n.t('errors.messages.should_have_page_or_title'))
    end
  end

  def has_prefix_if_link
    if menu_type == 'link' && !link.include?('http')
      errors.add(:link, I18n.t('errors.messages.should_have_prefix'))
    end
  end

  def self.update_order(menus, parent_id = nil)
    menus.each_with_index do |child_element, index|
      Menu.update(child_element['id'], parent_id: parent_id, position: index + 1)
      if child_element['children']
        update_order(child_element['children'], child_element['id'])
      end
    end
  end
end
