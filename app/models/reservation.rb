class Reservation < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :location, presence: true
  validates :start_time, presence: true

  has_many :locations, through: :location_reservations
  has_many :location_reservations, dependent: :destroy

  def end_time
    if duration != 0
      start_time + duration.hours
    else
      start_time.end_of_day
    end
  end

  def as_json(options = {})
    url = Rails.application.routes.url_helpers.reservation_path(self)
    if start_time.hour != 0
      { title: 'Bookning', start: start_time, end: end_time, url: url }
    else
      { title: 'Bookning', start: start_time.strftime('%Y-%m-%d'), url: url }
    end
  end
end
