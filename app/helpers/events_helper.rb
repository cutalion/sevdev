module EventsHelper
  def vkontakte_event_url(vk_event_id)
    url = "http://vkontakte.ru/event" + vk_event_id.to_s
    link_to url, url 
  end

  def ical_events(events)
    calendar = Icalendar::Calendar.new
    events.each { |event| calendar.add event.to_ical }
    calendar.publish
    
    return calendar.to_ical
  end
end
