class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  validates :password, length { :within => 6..14 }
end
