class Reservation < ActiveRecord::Base
  include CacheKey

  has_many :locations, through: :location_reservations
  has_many :location_reservations, dependent: :destroy

  scope :approved, -> { where(approved: true) }

  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :date, presence: true
  validate :has_locations
  validate :unique_per_day_and_location

  def as_json(options = {})
    url = Rails.application.routes.url_helpers.reservation_path(self)
    {
      title: "Bokning av #{locations.map(&:name).join(', ').downcase}",
      start: date,
      url: url,
      allDay: true
    }
  end

  def locations_to_s
    locations.map(&:name).join(', ').downcase
  end

  private

  def has_locations
    if locations.empty?
      errors.add(:location_ids, I18n.t('activerecord.errors.models.reservation.has_locations'))
    end
  end

  def unique_per_day_and_location
    same_day_reservations = Reservation.where(date: date).where.not(id: self)
    if same_day_reservations.count > 0
      other_locations = same_day_reservations.map(&:location_ids).flatten
      unless (other_locations & location_ids).empty?
        errors.add(:date, I18n.t('activerecord.errors.models.reservation.unique_per_day_and_location'))
      end
    end
  end
end
