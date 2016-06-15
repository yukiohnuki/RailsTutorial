module UsersHelper

	def current_user?(user)
      if user_logged_in?
       user = User.find(session[:user])
      end
    end
end
