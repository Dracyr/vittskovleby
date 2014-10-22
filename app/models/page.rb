class Page < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :permalink, presence: true, uniqueness: true,
                    exclusion: { in: %w(users posts pages) }

  belongs_to :menu
  acts_as_list scope: :menu

  default_scope -> { order("position ASC") }
  scope :orphans, -> { where(menu: nil) }

  before_validation :set_permalink

  def set_permalink
    self.permalink = title.parameterize
  end

  def to_param
    permalink
  end
end
