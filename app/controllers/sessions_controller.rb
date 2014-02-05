class SessionsController < ApplicationController
	def new
		render :new
	end

	def create
		user = User.find_by_credentials(
			params[:user][:username],
			params[:user][:password]
			)

		if user.nil?
			flash[:notices] = ["Credentials were wrong"]
			redirect_to new_session_url
		else
			self.current_user = user
			flash[:notices] = ["Welcome, #{user.username}!"]
			redirect_to user_url(user)
		end
	end

	def destroy

	end
end
