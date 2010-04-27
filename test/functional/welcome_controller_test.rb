require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  context "Welcome controller" do

    context "on GET to :index" do

      setup do
        get :index
      end

      should_respond_with :success

    end

  end
end
