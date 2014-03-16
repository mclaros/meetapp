class User < ActiveRecord::Base
  attr_accessible :bio, :date_of_birth, :email, :full_name, :location, :password
  attr_reader :password

  validates_presence_of :username, :full_name, :email, :session_token
  validates_presence_of :password_digest, :message => "Password can't be blank"
  validates_uniqueness_of :username, :email
  validates_length_of :username, in: 2..15
  validates_length_of :bio, maximum: 500
  validates_length_of :password, minimum: 6, allow_nil: true

  after_initialize :ensure_session_token

  has_many :comments,
          :foreign_key => :author_id
  has_many :groups,
          :class_name => "Group",
          :primary_key => :id,
          :foreign_key => :founder_id
  has_many :meetings,
          :class_name => "Meeting",
          :primary_key => :id,
          :foreign_key => :organizer_id
  has_many :group_memberships,
          :class_name => "GroupMembership",
          :primary_key => :id,
          :foreign_key => :user_id
  has_many :meeting_guests,
          :class_name => "MeetingGuest",
          :primary_key => :id,
          :foreign_key => :user_id

  has_many :memberships, :through => :group_memberships, :source => :group
  has_many :rsvps, :through => :meeting_guests, :source => :meeting

  def self.find_by_credentials(username, password)
  	user = User.find_by_username(username)
    return nil if user.nil?
  	user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
  	SecureRandom::urlsafe_base64(16)
  end

  def is_password?(password)
  	BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
  	@password = password
  	self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
  	self.session_token = self.class.generate_session_token
  	self.save!
  end

  def first_name
    full_name.split(' ').first
  end

  private
  def ensure_session_token
  	self.session_token ||= self.class.generate_session_token
  end

end
