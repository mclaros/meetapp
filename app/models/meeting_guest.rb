class MeetingGuest < ActiveRecord::Base
  attr_accessible :meeting_id, :user_id, :status, :rsvp_comment
  validates_presence_of :meeting_id, :user_id, :status
  validates :status, inclusion: { in: ["ATTENDING", "NOT ATTENDING", "MAYBE"] }
  validates_length_of :rsvp_comment, :maximum => 200

  belongs_to :user
  belongs_to :meeting
end
