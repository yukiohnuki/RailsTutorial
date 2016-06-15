module SessionsHelper

  def user_logged_in?
    session[:user].present?
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end
 
  def current_user
    if user_logged_in?
       User.find(session[:user])
    end
  end
end