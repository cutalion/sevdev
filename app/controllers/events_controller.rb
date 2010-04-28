require 'icalendar'
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
  
  def ical
    events = Event.find :all
    calendar = Icalendar::Calendar.new
    
    events.each do |event|
      ievent = Icalendar::Event.new
      ievent.start = event.started_at.strftime("%Y%m%dT%H%M")
      ievent.end = event.started_at.strftime("%Y%m%dT%H%M")
      ievent.summary = event.name
      ievent.description = event.description
      ievent.location = event.place
      calendar.add ievent
    end
    
    calendar.publish
    headers['Content-Type'] = "text/calendar; charset=UTF-8"
    render :text => calendar.to_ical
  end
end
