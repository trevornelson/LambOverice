module ApplicationHelper

  def curr_user
    User.find(session[:user_id])
  end


  def curr_user_path
    user_path(session[:user_id])
  end


end
