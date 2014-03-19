class GroupsController < ApplicationController
	before_filter :require_current_user!, :only => [:new]

	def index
		@groups = Group.all
		render :index
	end

	def show
		@group = Group.find(params[:id])
		render :show
	end

	def new
		render :new
	end

	def create
		@group = Group.new(params[:group])
		@group.founder_id = current_user.id
		@group.demonym = "Member" if @group.demonym.empty?

		if @group.save
			flash[:notices] = ["Successfully created group: #{@group.name}"]
			redirect_to group_url(@group)
		else
			flash.now[:notices] = @group.errors.full_messages
			render :new
		end
	end
end
