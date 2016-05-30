class User < ActiveRecord::Base
  attr_accessor :remember_token

  validates :name, presence: true, 
      length: { maximum: 25 }

  VALID_EMAIL_REGEX = /\A\w+@\w+\.\w+\z/i
  before_save { self.email = self.email.downcase }
  validates :email, presence: true, 
      length: { maximum: 255 }, 
      format: { with: VALID_EMAIL_REGEX },
      uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }, allow_nil: true

  has_many :croaks, dependent: :destroy

  # hash digest for a string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # get a new token for creating a new remember_token on log in
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #generate the feed of croaks for a user
  def feed
    Croak.where("user_id = ?", self.id)
  end

  #set the remember_digest in the model until next log in
  def remember
    self.remember_token = User.new_token
    self.update_attribute :remember_digest, User.digest(remember_token)
  end

  #clear remember_digest
  def forget
    self.update_attribute :remember_digest, nil
  end

  # returns whether the user is authenticated with a valid remember_token from the session cookie
  def authenticated?(remember_token)
    return false if self.remember_digest.nil?
    BCrypt::Password.new(self.remember_digest).is_password?(remember_token)
  end
end