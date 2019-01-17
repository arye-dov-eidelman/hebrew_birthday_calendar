class User < ApplicationRecord
  has_many :calendar_users
  has_many :calendars, through: :calendar_users
  has_secure_password

  validates :name, length: { in: 1..12 }
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "invalid email address" }
end
