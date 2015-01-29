class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  def new
    @event = Event.new
  end
  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to root_path
  end
  def show
    set_event
  end
  def destroy

  end
private
  def set_event
    @event = Event.find(params[:id])
  end
  def event_params
    params.require(:event).permit(:name, :description, :date)
  end
end
