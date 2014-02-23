class Meeting < ActiveRecord::Base
  attr_accessible :description, :group_id, :location, :name, :user_id

	belongs_to :organizer,
						:class_name => "User",
						:primary_key => :id,
						:foreign_key => :organizer_id 
end
