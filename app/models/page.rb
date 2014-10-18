class Page < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :content, presence: true

  has_many :children, class_name: "Page", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Page"

  scope :orphans, -> { where(parent: nil) }

end
