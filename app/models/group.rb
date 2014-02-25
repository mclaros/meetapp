class Group < ActiveRecord::Base
  attr_accessible :description, :founder_id, :name

  validates_presence_of :name, :description, :founder_id
  validates_length_of :name, :within => 2..50
  validates_length_of :description, :maximum => 500

  belongs_to :founder,
  					:class_name => "User",
  					:primary_key => :id,
  					:foreign_key => :founder_id
  has_many :comments, :as => :commentable
  has_many :group_memberhips,
 					:class_name => "GroupMembership",
 					:primary_key => :id,
 					:foreign_key => :group_id
 	has_many :members, :through => :group_memberhips, :source => :user
end
