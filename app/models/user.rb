class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  validates :password, length: { minimum: 6, maximum: 14 }
  validates :password_confirmation, length: { minimum: 6, maximum: 14 }
  validates :firstname, presence: true
  validates :lastname, presence: true

  before_save :lowercase_email

  def lowercase_email
    self.email.downcase!
  end

end
