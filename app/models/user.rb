class User < ActiveRecord::Base
  attr_accessible :bio, :date_of_birth, :email, :full_name, :location, :username, :password
  attr_reader :password

  validates_presence_of :username, :full_name, :email, :session_token
  validates_presence_of :password_digest, :message => "Password can't be blank"
  validates_uniqueness_of :username, :email
  validates_length_of :username, in: 2..15
  validates_length_of :bio, maximum: 500
  validates_length_of :password, minimum: 6, allow_nil: true

  after_initialize :ensure_session_token

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

  private
  def ensure_session_token
  	self.session_token ||= self.class.generate_session_token
  end

end
