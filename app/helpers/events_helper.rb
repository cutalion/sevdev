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
  
  def bitly_shorten(url)
    config = YAML.load_file(RAILS_ROOT + '/config/bitly_api_key.yml')[RAILS_ENV]
    
    bitly = Bitly.new(config['login'], config['api_key'])
    page_url = bitly.shorten(url)
    
    return page_url.shorten
  end
  
  def retweet_url(event)
    return link_to image_tag("retweet-over.png"), URI.escape(['http://twitter.com/home?status=' + event.started_at.to_s(:event), event.name, bitly_shorten(url_for(:action => 'show', :id => event.id, :only_path => false))].join(' '))
  end
end
