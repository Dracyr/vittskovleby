class StaticController < ApplicationController
  skip_load_and_authorize_resource
  layout "static_layout"

  def home
    @events = Event.take(3)
  end
end
