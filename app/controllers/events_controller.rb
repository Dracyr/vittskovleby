class EventsController < ApplicationController
  load_resource
  authorize_resource except: [:calendar, :index]
  respond_to :html, :json

  def index
    authorize!(:index, @events) unless params[:format] == 'json'
    @events = @events.order(created_at: :desc)
  end

  def show
  end

  def new
  end

  def create
    @event = Event.create event_params
    respond_with @event
  end

  def edit
  end

  def update
    @event.update event_params
    respond_with @event
  end

  def destroy
    @event.destroy
    respond_with @event
  end

  def calendar
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :start_time)
  end

end
