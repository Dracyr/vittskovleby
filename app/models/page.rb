class Page < ActiveRecord::Base
  has_one :menu, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :permalink, presence: true, uniqueness: true,
                    exclusion: { in: %w(users events pages images editable_fields reservations) }

  before_validation :set_permalink
  after_save :touch_menu, if: Proc.new { |page| page.menu.present? }

  scope :orphans, -> { includes(:menu).where('pages.id IS NULL') }

  def set_permalink
    self.permalink = title.parameterize
  end

  def to_param
    permalink
  end

  private

  def touch_menu
    menu.touch
  end
end
