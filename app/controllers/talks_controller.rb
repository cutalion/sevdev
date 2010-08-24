class TalksController < ApplicationController
  before_filter :require_user, :only => [:create]
  layout 'application', :except => :new
  
  def index
     @talks = Talk.find :all, :order => 'updated_at DESC', :include => :comments
  end
  
  def show
    @talk = Talk.find(params[:id])
  end
  
  def new
     @talk = Talk.new
  end
  
  def create
    @talk = Talk.new(params[:talk])
    @talk.title = 'empty'
    @talk.user = current_user
    @talk.save
    #flash[:notice] = t ".talk_started"
    redirect_to talks_url
  end
end
