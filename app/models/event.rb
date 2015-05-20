class Event < ActiveRecord::Base
  include CacheKey

  validates :title, presence: true
  validates :content, presence: true
  validates :start_time, presence: true

  def end_time
    duration != 0 ? start_time + duration.hours : start_time.end_of_day
  end

  def as_json(options = {})
    url = Rails.application.routes.url_helpers.event_path(self)
    data = { title: title, url: url }
    if start_time.hour != 0
      data.merge({ start: start_time, end: end_time })
    else
      data.merge({ start: start_time.strftime('%Y-%m-%d') })
    end
  end
end
