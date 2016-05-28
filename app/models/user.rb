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
  validates :password, length: { minimum: 6 }

  # hash digest for a string
  def User.digest(string) {
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine::cost
    BCrypt::Password.create(string, cost: cost)
  }

  # get a new token for creating a new remember_token on log in
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # set the remember_digest in the model until next log in
  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end
end