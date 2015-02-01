class HomeController < ApplicationController
  def index
    @users = User.all
  end
  def events
    @events = Event.this_month 
  end
end
