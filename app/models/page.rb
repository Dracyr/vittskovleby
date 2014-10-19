class Page < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :permalink, presence: true, uniqueness: true,
                    exclusion: { in: %w(users posts pages) }

  has_many :children, class_name: "Page", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Page"
  acts_as_list scope: :parent

  default_scope -> { order("position ASC") }
  scope :orphans, -> { where(parent: nil) }

  before_validation :set_permalink

  def set_permalink
    self.permalink = title.parameterize
  end

  def to_param
    permalink
  end
end
