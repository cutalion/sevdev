class EventsController < ApplicationController
  def index
    @events = Event.find :all, :order => 'started_at ASC'
  end
  
  def show
    @event = Event.find(params[:id])
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.center_zoom_init([44.5939989,33.4776271], 15)
    @map.overlay_init(GMarker.new([44.5939989,33.4776271], :title => "FESTO", :info_window => "Институт современных технологий<br>и инноваций СевНТУ-FESTO"))
  end
  
  def create
  end
  
  def update
  end
  
  def delete
  end
end
