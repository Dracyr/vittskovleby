class Reservation < ApplicationRecord
  include CacheKey

  has_many :location_reservations, dependent: :destroy
  has_many :locations, through: :location_reservations

  scope :approved, -> { where(approved: true) }

  validates :name,  presence: true
  validates :email, presence: true, format: /\A\S+@.+\.\S+\z/
  validates :phone, presence: true
  validates :date,  presence: true
  validates :invoice_address,  presence: true
  validates :invoice_option,  presence: true
  validate  :locations?
  validate  :unique_per_day_and_location

  enum invoice_option: [:pdf, :mail]

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

  def locations?
    return unless locations.empty?
    errors.add(:location_ids, I18n.t('activerecord.errors.models.reservation.has_locations'))
  end

  def unique_per_day_and_location
    other_locations = Reservation
      .joins(:locations)
      .where(date: date)
      .where.not(id: self)
      .pluck(:location_id)

    return if (other_locations & location_ids).empty?
    errors.add(:date, I18n.t('activerecord.errors.models.reservation.unique_per_day_and_location'))
  end
end
