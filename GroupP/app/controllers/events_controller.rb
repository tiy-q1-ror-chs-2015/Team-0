class EventsController < ApplicationController
  def index
    @user = User.find current_user
    @events = @user.events
  end
  def new
    @users = User.all
    @event = Event.new
  end
  def create
    @user = User.find current_user
    @event = @user.events.new(event_params)
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
    @users = User.all
  end

  def edit
    set_event
    @users = User.all
  end

  def update
    @user= User.find current_user
    set_event
    @user.events.update_attributes event_params
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
      :user_id,
      user_ids: [],
      event_ids: []
      )
  end
end
