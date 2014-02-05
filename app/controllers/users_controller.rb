class UsersController < ApplicationController
	def index
		@users = User.all
		render :index
	end

	def show
		@user = User.find(params[:id])
		render :show
	end

	def new
		render :new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			self.current_user = @user
			redirect_to user_url(@user)
		else
			flash[:notices] = @user.errors.full_messages
			redirect_to new_user_url
		end
	end
end
