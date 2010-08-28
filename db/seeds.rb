# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
Place.delete_all
Event.delete_all

places = Place.create([
  {:name => 'FESTO', :latitude => 44.5939989, :longitude => 33.4776271, :address => 'ул. Университетская 33 (СевНТУ)'},
  {:name => 'SoftServ', :latitude => 44.594601, :longitude => 33.513032, :address => 'ул. Коммунистическая 10а, офис 40'}
])
Event.create([
  {:name => 'ROR доклад на встрече .NET User Group', :description => <<DESCRIPTION1 , 
Встреча Microsoft .NET User Group #2<br/><br/>

Доклады:<br/><br/>

  "LINQ – Language Integrated Query", Вадим Федоров<br/>
  "Введение в Entity framework", Алексей Голиков<br/>
  "Введение в Ruby on Rails", Андрей Огневский
DESCRIPTION1
  :vkontakte_event_id => 16141113, :place => places[1], :started_at => '2010-03-26 19:00'},
  {:name => 'Конференция посвященная Ruby on Rails', :description => <<DESCRIPTION2 ,
Встреча программистов Севастополя, интересующихся Ruby и Ruby on Rails.<br/><br/>

Темы докладов:<br/><br/>

  * Rails Magic - о том, что в руби и рельсах помогает ускорить разработку<br/>
  * Rails Way - о том, что используют RoR-разработчкиб, об инструментах и сообществе<br/>
  * Rails for PHP developers - сравнение PHP и Ruby, некоторых PHP-фреймворков и Ruby on Rails<br/>
  * Simple Application - возможно будет, как часть одного из докладов
DESCRIPTION2
  :vkontakte_event_id => 16725339, :place => places[0], :started_at => '2010-04-23 18:00'}
])
