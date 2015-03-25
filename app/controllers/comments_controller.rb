class CommentsController < ApplicationController

  def create
    user        = User.find(session[:user_id])
    question_id = params[:question_id]
    answer_id   = params[:answer_id]
    question_id ? commentable = Question.find(question_id) : commentable = Answer.find(answer_id)
    comment = Comment.new(content: params[:comment][:content], commentable: commentable, user: user )
    comment.save
    redirect_to :back
  end

  def index
    question = Question.find(params[:question_id])
    comments = question.comments.with_user
    render json: comments
  end

end
