class SessionsController < ApplicationController

  def new
    redirect_to curr_user_path if session[:user_id]
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      session[:message] = "invalid username and/or password"
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end

end
