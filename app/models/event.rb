class Event < ActiveRecord::Base
  validates_presence_of :started_at, :name, :description
  belongs_to :place

  def to_ical
    ievent = Icalendar::Event.new
    ievent.start = started_at.strftime("%Y%m%dT%H%M%S")
    ievent.end = started_at.strftime("%Y%m%dT%H%M%S")
    ievent.summary = name
    ievent.description = description
    ievent.location = place

    return ievent
  end
end
