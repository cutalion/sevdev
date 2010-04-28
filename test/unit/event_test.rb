require 'test_helper'

class EventTest < ActiveSupport::TestCase
  context "Event" do

    should_validate_presence_of :started_at, :name, :description, :place

    should "return ical event" do
      event = Factory(:event)
      assert_equal Icalendar::Event, event.to_ical.class
    end
  end
end
