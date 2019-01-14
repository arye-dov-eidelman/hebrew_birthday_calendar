class CalendarUser < ApplicationRecord
  belongs_to :calendar
  belongs_to :user

  validates :access_level, inclusion: { in: ["view", "edit", "admin"] }
end
