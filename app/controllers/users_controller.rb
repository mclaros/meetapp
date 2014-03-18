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
		#NOTE: Do not want to allow changing of username afterwards
		@user = User.new(params[:user].except(:username))
		@user.username = params[:user][:username]
		if @user.save
			# check to see if params[:password_confirm] == params[:password]
			self.current_user = @user
			redirect_to user_url(@user)
		else
			flash.now[:notices] = @user.errors.full_messages
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
		render :edit
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to user_url(@user)
		else
			flash.now[:notices] = @user.errors.full_messages
			render :edit
		end
	end
end
