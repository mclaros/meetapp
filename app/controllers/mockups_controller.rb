class MockupsController < ApplicationController
	def root_index
		render '/mockups/root/index'
	end

	def user_show
		render '/mockups/users/show'
	end

	def meeting_show
		render '/mockups/meetings/show'
	end

	def group_show
		render '/mockups/groups/show'
	end

	def group_meeting
		render '/mockups/groups/group_meeting'
	end

	def group_members
		render '/mockups/groups/members'
	end
end
