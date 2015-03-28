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

  after_create :send_confirmation_mail
  after_save   :send_approved_mail, if: Proc.new {|r| r.approved_changed? }

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

  def send_confirmation_mail
    ReservationMailer.reservation_created(self).deliver
  end

  def send_approved_mail
    ReservationMailer.reservation_approved(self).deliver
  end
end
