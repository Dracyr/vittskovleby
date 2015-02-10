class Page < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :permalink, presence: true, uniqueness: true,
                    exclusion: { in: %w(users events pages images editable_fields) }

  before_validation :set_permalink

  has_one :menu, dependent: :destroy

  # TODO: Optimize query
  scope :orphans, -> { Page.all - Page.joins(:menu) }

  def set_permalink
    self.permalink = title.parameterize
  end

  def to_param
    permalink
  end
end
