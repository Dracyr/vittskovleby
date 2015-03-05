class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  validates :start_time, presence: true

  def end_time
    if duration != 0
      start_time + duration.hours
    else
      start_time.end_of_day
    end
  end

  def as_json(options = {})
    url = Rails.application.routes.url_helpers.event_path(self)
    if start_time.hour != 0
      { title: title, start: start_time, end: end_time, url: url }
    else
      { title: title, start: start_time.strftime('%Y-%m-%d'), url: url }
    end
  end
end
