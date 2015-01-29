class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  def new
    @event = Event.new
  end
  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = 'Event was successfully added.'
      redirect_to root_path
    else
      flash[:error] = "Event was NOT added."
      render :new
    end
  end
  def show
    set_event
  end

  def edit
    set_event
  end

  def update
    set_event
    @event.update_attributes event_params
    if @event.update_attributes event_params
      flash[:notice] = 'Event was successfully added.'
      redirect_to event_path(@event)
    else
      flash[:error] = "Event was NOT added."
      render :edit
    end
  end
  def destroy
    set_event
    @event.destroy
    redirect_to root_path
  end
private
  def set_event
    @event = Event.find(params[:id])
  end
  def event_params
    params.require(:event).permit(:name, :description, :date)
  end
end
