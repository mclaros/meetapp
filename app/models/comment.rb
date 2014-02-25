class Comment < ActiveRecord::Base
  attr_accessible :author_id, :commentable_id, :commentable_type
end
