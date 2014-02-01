class User < ActiveRecord::Base
  attr_accessible :bio, :date_of_birth, :email, :full_name, :location, :username
  validates_presence_of :username, :full_name, :email
  validates_length_of :username, in: 2..15
  validates_length_of :bio, maximum: 500
end
