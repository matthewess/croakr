class User < ActiveRecord::Base

  VALID_EMAIL_REGEX = /\A\w+@\w+\.\w+\z/i

  before_save { self.email = self.email.downcase }

  validates :name, presence: true, 
      length: { maximum: 25 }
  validates :email, presence: true, 
      length: { maximum: 255 }, 
      format: { with: VALID_EMAIL_REGEX },
      uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }

end
