class EventsController < ApplicationController
  def index
    @events = Event.find :all, :order => 'started_at ASC'
  end
  
  def show
    @event = Event.find(params[:id])
    if !@event.place.nil?
      @map = GMap.new("map_div")
      @map.control_init(:large_map => true,:map_type => true)
      @map.center_zoom_init([@event.place.latitude, @event.place.longitude], 15)
      @map.overlay_init(GMarker.new([@event.place.latitude, @event.place.longitude], :title => @event.place.name, :info_window => [@event.place.name, @event.place.address].join(', ')))
    end
  end
  
  def create
  end
  
  def update
  end
  
  def delete
  end
end
