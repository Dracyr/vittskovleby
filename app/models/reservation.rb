class Reservation < ActiveRecord::Base
  include CacheKey

  has_many :locations, through: :location_reservations
  has_many :location_reservations, dependent: :destroy

  scope :approved, -> { where(approved: true) }

  validates :name,  presence: true
  validates :email, presence: true, format: /\A\S+@.+\.\S+\z/
  validates :phone, presence: true
  validates :date,  presence: true
  validate  :has_locations
  validate  :unique_per_day_and_location

  def as_json(options = {})
    url = Rails.application.routes.url_helpers.reservation_path(self)
    {
      title: "Bokning av #{locations_to_s}",
      start: date,
      url: url,
      allDay: true
    }
  end

  def locations_to_s
    locations.pluck(:name).to_sentence
  end

  private

  def has_locations
    if locations.empty?
      errors.add(:location_ids, I18n.t('activerecord.errors.models.reservation.has_locations'))
    end
  end

  def unique_per_day_and_location
    other_locations = Reservation
      .joins(:locations)
      .where(date: date)
      .where.not(id: self)
      .pluck(:location_id)

    unless (other_locations & location_ids).empty?
      errors.add(:date, I18n.t('activerecord.errors.models.reservation.unique_per_day_and_location'))
    end
  end
end
