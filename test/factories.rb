Factory.sequence(:login) {|n| "login-#{n}"}
Factory.sequence(:email) {|n| "email#{n}@example.com"}


Factory.define :event do |f|
  f.name        'Test Event'
  f.place       'Some cool place'
  f.description 'Test Event description'
  f.started_at  { Time.new + 1.day }
  f.vkontakte_event_id 100000
end


Factory.define :user do |f|
  f.login  Factory.next(:login)
  f.email  Factory.next(:email)
  f.password 'password123'
  f.password_confirmation {|u| u.password}
end
