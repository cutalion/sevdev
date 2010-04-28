module EventsHelper
  def vkontakte_event_url(vk_event_id)
    url = "http://vkontakte.ru/event" + vk_event_id.to_s
    link_to url 
  end
end
