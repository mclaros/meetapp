class MeetingsController < ApplicationController

	def index
		if params[:user_id]
			@meetings = Meeting.organized_by(params[:user_id])
			# .includes(organizer) ?
			# @source = User.find(params[:user_id])
		elsif params[:group_id]
			@meetings = Meeting.hosted_by(params[:group_id])
			# .includes(organizer) ?
			# @source = Group.find(params[:group_id])
		else
			@meetings = Meeting.all
			# @source = nil
		end
		render :index
	end

	def show

	end

	def new
		render :new
	end

	def create
		@meeting = Meeting.new(params[:meeting])

		if meeting.save
			flash[:notices] = ["Successfully created new meeting: #{@meeting.name}"]
			redirect_to meeting_url(@meeting)
		else
			flash.now[:notices] = @meeting.errors.full_messages
			render :new
		end
	end
end