class Menu < ActiveRecord::Base
  has_many   :children,  class_name: 'Menu', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Menu'
  acts_as_list scope: :parent

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

  def self.update_order(menus, parent_id = nil)
    menus.each_with_index do |child_element, index|
      Menu.update(child_element['id'], parent_id: parent_id, position: index + 1)
      if child_element['children']
        update_order(child_element['children'], child_element['id'])
      end
    end
  end
end
