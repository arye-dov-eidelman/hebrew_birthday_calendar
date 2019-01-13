class HebrewDate < ApplicationRecord
  validates :month, inclusion: { in: (1..12).to_a }
  validates :day,   inclusion: { in: (1..30).to_a }

  # ToDo: add validation to is_adar_b that it can only be set in adar
end
