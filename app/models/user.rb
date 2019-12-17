class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  validates :password, length: {minimum: 6, maximum: 14}
  validates :firstname, presence: true
  validates :lastname, presence: true
end
