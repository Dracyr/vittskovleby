class MenuItem < ActiveRecord::Base

  belongs_to :menu
  belongs_to :page

  acts_as_list scope: :menu

  default_scope -> { order("position ASC") }
  scope :orphans, -> { where(menu: nil) }

  enum item_type: [:page, :link]

  def title
    case item_type
    when 'page'
      page.title
    when 'link'
      self[:title]
    end
  end

  def link
    case item_type
    when 'page'
      page.permalink
    when 'link'
      self[:link]
    end
  end
end

