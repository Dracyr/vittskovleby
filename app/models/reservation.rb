class Reservation < ActiveRecord::Base
  has_many :locations, through: :location_reservations
  has_many :location_reservations, dependent: :destroy

  scope :approved, -> { where(approved: true) }

  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :date, presence: true
  validate :has_locations

  def as_json(options = {})
    url = Rails.application.routes.url_helpers.reservation_path(self)
    {
      title: "Bokning av #{locations.map(&:name).join(', ').downcase}",
      start: date,
      url: url,
      allDay: true
    }
  end

  private

  def has_locations
    if locations.empty?
      errors.add(:location_ids, I18n.t('activerecord.errors.models.reservation.has_locations'))
    end
  end
end
