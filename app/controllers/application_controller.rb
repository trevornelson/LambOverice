class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def curr_user
    User.find(session[:user_id])
  end

  def curr_user_path
    user_path(session[:user_id])
  end

  def commentable
    params[:question_id] ?  Question.find(params[:question_id]) : Answer.find(params[:answer_id])
  end
end
