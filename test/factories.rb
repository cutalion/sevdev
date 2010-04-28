Factory.define :event do |t|
  t.name        'Test Event'
  t.place       'Some cool place'
  t.description 'Test Event description'
  t.started_at  { Time.new + 1.day }
  t.vkontakte_event_id 100000
end
