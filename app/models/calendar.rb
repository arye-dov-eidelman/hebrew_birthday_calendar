class Calendar < ApplicationRecord
  has_many :calendar_users
  has_many :users, through: :calendar_users

  validates :slug, uniqueness: true
end
