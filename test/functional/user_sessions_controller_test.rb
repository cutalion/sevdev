require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  context "UserSessions controller" do

    context "on GET to :new" do

      setup do
        get :new
      end

      should_respond_with :success

    end


    context "on POST to :create" do

      setup do
        @user = Factory.create :user, :password => 'password'
      end

      should "log in user" do
        post :create, :user_session => {:login => @user.login, :password => 'password'}
        assert_redirected_to account_url
      end

      should "not log in without correct login/password" do
        post :create, :user_session => {:login => @user.login, :password => 'wrong password'}
        assert_template :new

        post :create, :user_session => {:login => "wrong login", :password => 'password'}
        assert_template :new

        post :create
        assert_template :new
      end

    end

  end
end
