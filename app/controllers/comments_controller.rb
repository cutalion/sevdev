class CommentsController < ApplicationController
  before_filter :require_user, :only => [:new, :create]
  before_filter :get_talk
    
  def new
     @comment = Comment.new
  end
  
  def create
    @comment = @talk.comments.new(params[:comment])
    @comment.user = current_user
    if @comment.save
      flash[:notice] = t ".comment_added"
      redirect_to talk_url(@talk)
    else
      render :action => :new
    end
  end
  
  private

    def get_talk
       @talk = Talk.find(params[:talk_id])
    end
end
