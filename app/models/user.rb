class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true, length: { in: 8..15 }

  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    user = User.find_by(email: email)

    user && user.authenticate(password) ? user : nil
  end
end
