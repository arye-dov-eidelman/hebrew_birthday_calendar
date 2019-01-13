class Event < ApplicationRecord
  belongs_to :calendar
  belongs_to :hebrew_date
  
  validates :title, length: { in: 1..50 }
end
