class Group < ActiveRecord::Base
  attr_accessible :description, :founder_id, :name

  belongs_to :founder,
  					:class_name => "User",
  					:primary_key => :id,
  					:foreign_key => :founder_id
  has_many :group_memberhips,
 					:class_name => "GroupMembership",
 					:primary_key => :id,
 					:foreign_key => :group_id
 	has_many :members, :through => :group_memberhips, :source => :user
end
