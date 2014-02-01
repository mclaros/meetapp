class UsersController < ApplicationController
	def index
		@users = User.all
		render :index
	end

	def show

	end

	def new
		render :new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to users_url
		else
			redirect_to new_user_url
		end
	end
end
