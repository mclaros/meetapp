module SessionsHelper
	def current_user=(user)
		@current_user = user
		session[:session_token] = user.session_token
	end

	def current_user
		return nil if session[:session_token].nil?
		@current_user ||= User.find_by_session_token(session[:session_token])
	end

	def logged_in?
		!current_user.nil?
	end

	def logout_current_user!
		current_user.reset_session_token!
		session[:session_token] = nil
	end

	def require_current_user!
		if !logged_in?
			flash[:notices] = ["Must be logged in to do that"]
			redirect_to new_session_url
		end
	end
end
