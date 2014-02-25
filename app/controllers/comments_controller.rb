class CommentsController < ApplicationController
	def index
		@commentable = find_commentable
		@comments = @commentable.comments
	end

	def create
		#Currently only nested under Meetings and Groups
		@commentable = find_commentable
		@comment = @commentable.comments.build(params[:comment])
		if @comment.save
			
		else

		end
	end

	def update
		#Currently only nested under Meetings and Groups
		@commentable = find_commentable
		# @comment = @commentable.comments.where(:id => params[:comment_id])
		# if @comment.update_attributes(params[:comment])
			#@comment.updated = true
		# else
			# redirect_to :id => nil
		# end
	end

	private

		def find_commentable
			params.each do |name, value|
				if name =~ /(.+)_id$/
					return $1.classify.constantize.find(value)
				end
			end
			nil
		end
end
