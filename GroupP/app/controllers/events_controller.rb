class EventsController < ApplicationController
  def index
    @user = User.find current_user
    @events = @user.events
  end
  def sidebar
    @user = User.find current_user
    @event = @user.events
  end
  def new
    @event = Event.new
    @users = User.all
  end

  def create
    @users = User.all
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = 'Event was successfully added.'
      redirect_to user_events_path(current_user)
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
    @users = User.all
  end

  def update
    set_event
    @users = User.all
    @event.update_attributes event_params
    if @event.update_attributes event_params
      flash[:notice] = 'Event was successfully added.'
      redirect_to user_event_path(current_user.id, @event)
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
    params.require(:event).permit(
      :name,
      :description,
      :date,
      user_ids: [],
      event_ids: []
      )
  end
end
