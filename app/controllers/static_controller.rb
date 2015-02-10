class StaticController < ApplicationController
  layout "static_layout"

  def home
    @events = Event.take(3)
  end
end
