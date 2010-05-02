class EventsController < ApplicationController
  def index
    @events = Event.find :all, :order => 'started_at ASC'
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def create
  end
  
  def update
  end
  
  def delete
  end
end
