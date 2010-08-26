class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(:vk_username => params[:login])
    render :text => (@user_session.save) ? 'awesome' : 'shit';
    #if @user_session.save
    #  redirect_back_or_default account_url
    #else
    #  render :action => :new
    #end
  end

  def destroy
    current_user_session.destroy
    redirect_to root_url
  end

end