class Meeting < ActiveRecord::Base
  attr_accessible :name, :description, :location, :start_date,
  	:start_time, :end_date, :end_time, :time_zone, :suggested_donation,
  	:is_past, :is_private, :additional_instructions

  after_find :check_if_past

	validates_presence_of :organizer_id, :name, :description, :location,
		:start_date, :start_time, :time_zone
	validates_length_of :name, :maximum => 50
	validates_length_of :description, :maximum => 500
	validates_length_of :location, :additional_instructions, :maximum => 200

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

	def self.organized_by(organizer_id)
		self.where(:organizer_id => organizer_id)
	end

	def self.hosted_by(group_id)
		self.where(:group_id => group_id)
	end

	private

	def check_if_past
		
	end
end
