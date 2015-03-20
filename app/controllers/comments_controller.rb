class CommentsController < ApplicationController

  def create
    user        = User.find(session[:user_id])
    question_id = params[:question_id]
    answer_id   = params[:answer_id]
    question_id ? commentable = Question.find(question_id) : commentable = Answer.find(answer_id)
    comment = Comment.new(content: params[:comment][:content], commentable: commentable, user: user )
    if comment.save
      render text: "I return a JSON object that says I saved myself"
    else
      render text: " I return an error message"
    end
  end

end
