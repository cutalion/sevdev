class Event < ActiveRecord::Base
  validates_presence_of :started_at, :name, :description, :place

  def to_ical
    ievent = Icalendar::Event.new
    ievent.start = started_at.strftime("%Y%m%dT%H%M")
    ievent.end = started_at.strftime("%Y%m%dT%H%M")
    ievent.summary = name
    ievent.description = description
    ievent.location = place

    return ievent
  end
end
