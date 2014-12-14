class Menu < ActiveRecord::Base
  #validates :title, presence: true, uniqueness: true

  has_many   :children,  class_name: 'Menu', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Menu'
  acts_as_list scope: :parent

  belongs_to :page

  default_scope -> { order("position ASC") }
  scope :orphans, -> { where(parent: nil) }

  enum menu_type: [:menu, :page, :link]

  def title
    menu_type == 'page' ? page.title : self[:title]
  end

  def link
    menu_type == 'page' ? page.permalink : self[:link]
  end
end
