class Comment < ActiveRecord::Base
  attr_accessible :author_id, :commentable_id, :commentable_type, :content
  validates_presence_of :content, :author_id, :commentable_id, :commentable_type
  validates_length_of :content, :maximum => 300

  belongs_to :commentable, :polymorphic => true
  belongs_to :author,
  					:class_name => "User",
  					:foreign_key => :author_id
  has_many :replies, :as => :commentable,
  				:class_name => "Comment"
end
