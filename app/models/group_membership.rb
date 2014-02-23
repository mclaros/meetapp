class GroupMembership < ActiveRecord::Base
  attr_accessible :group_id, :user_id
  validates :group_id, :user_id, :presence => true

  belongs_to :user
  belongs_to :group
end
