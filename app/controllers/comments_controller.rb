class CommentsController < ApplicationController

  def create
    Comment.create(content: params[:comment][:content], commentable: commentable, user: curr_user )
    redirect_to :back
  end

end
