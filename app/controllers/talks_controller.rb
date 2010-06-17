class TalksController < ApplicationController
  before_filter :require_user, :only => [:new, :create]
  
  def index
     @talks = Talk.find :all, :order => 'updated_at DESC'
  end
  
  def show
    @talk = Talk.find(params[:id])
  end
  
  def new
     @talk = Talk.new
  end
  
  def create
    @talk = Talk.new(params[:talk])
    @talk.user = current_user
    if @talk.save
      flash[:notice] = t ".talk_started"
      redirect_to talks_url
    else
      render :action => :new
    end
  end
end
