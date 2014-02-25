class Meeting < ActiveRecord::Base
  attr_accessible :description, :group_id, :location, :name, :user_id

	validates_presence_of :user_id, :name, :description
	validates_length_of :name, :maximum => 50
	validates_length_of :description, :maximum => 500

	belongs_to :organizer,
						:class_name => "User",
						:primary_key => :id,
						:foreign_key => :organizer_id 
	has_many :comments, :as => :commentable
	has_many :meeting_guests,
					:class_name => "MeetingGuest",
					:primary_key => :id,
					:foreign_key => :meeting_id
	has_many :guests, :through => :meeting_guests, :source => :user
end
