class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { in: 8..20 }
end
