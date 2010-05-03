require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  context "Events controller" do

    context "on GET to :index" do

      setup do
        get :index
      end

      should_respond_with :success

    end

  end
end
