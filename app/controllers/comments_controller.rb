class CommentsController < ApplicationController
  before_filter :require_user, :only => [:create]
  before_filter :get_talk
  layout 'application', :except => :new
    
  def new
     @comment = Comment.new
  end
  
  def create
    @comment = @talk.comments.new(params[:comment])
    @comment.user = current_user
    #flash[:notice] = t ".comment_added" if @comment.save
    @comment.save
    redirect_to talks_url
  end
  
  private

    def get_talk
       @talk = Talk.find(params[:talk_id])
    end
end
