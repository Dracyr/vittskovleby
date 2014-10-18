class Page < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :permalink, presence: true
  validates :permalink, uniqueness: true
  validate  :permalink_not_reserved_name
  validates :content, presence: true

  has_many :children, class_name: "Page", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Page"

  scope :orphans, -> { where(parent: nil) }

  before_validation :set_permalink

  def set_permalink
    self.permalink = title.parameterize
  end

  def to_param
    permalink
  end

  def permalink_not_reserved_name
    reserved_names = %w(users posts pages)
    if reserved_names.include? permalink
      errors.add(:permalink, I18n.t('errors.permalink_reserved'))
    end
  end
end
