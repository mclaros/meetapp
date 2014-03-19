class GroupMembership < ActiveRecord::Base
  attr_accessible :join_comment
  validates_presence_of :group_id, :user_id
  validates_length_of :join_comment, :maximum => 200

  belongs_to :user
  belongs_to :group
end
