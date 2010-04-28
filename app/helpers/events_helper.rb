module EventsHelper
  def vkontakte_event_url(vk_event_id)
    url = "http://vkontakte.ru/event" + vk_event_id.to_s
<<<<<<< HEAD
    link_to url, url 
=======
    link_to url 
>>>>>>> 0569218e708c0d575820828060e68bfc53681a7c
  end
end
