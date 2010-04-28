class EventsController < ApplicationController
  def index
    @events = Event.find :all, :order => 'created_at ASC'
  end
  
  def show
  end
  
  def create
  end
  
  def update
  end
  
  def delete
  end
end
