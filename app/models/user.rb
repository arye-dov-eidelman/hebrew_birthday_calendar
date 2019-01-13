class User < ApplicationRecord
  validates :name, length: { in: 1..12 }
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "invalid email address" }
end
