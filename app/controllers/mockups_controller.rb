class MockupsController < ApplicationController
	def root_index
		render '/mockups/root/index'
	end

	def user_show
		render '/mockups/users/show'
	end

	def meeting_show

	end

	def group_show
		render "/mockups/groups/show"
	end
end
