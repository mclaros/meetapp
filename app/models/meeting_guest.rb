class MeetingGuest < ActiveRecord::Base
  attr_accessible :meeting_id, :user_id, :status
  validates_presence_of :meeting_id, :user_id, :status
  validates :status, inclusion: { in: ["ATTENDING", "NOT ATTENDING", "MAYBE"] }

  belongs_to :user
  belongs_to :meeting
end
