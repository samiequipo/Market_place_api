class User < ApplicationRecord
  before_save {self.email = email.downcase}
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true,
                    length: {minimum:3, maximum:25}, format: { with: VALID_EMAIL_REGEX }
  validates :password_digest, presence: true
  
  has_secure_password
end
