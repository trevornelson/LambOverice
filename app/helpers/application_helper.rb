module ApplicationHelper

  def curr_user
    User.find(session[:user_id])
  end

end
