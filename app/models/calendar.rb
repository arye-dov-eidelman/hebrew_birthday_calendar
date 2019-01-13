class Calendar < ApplicationRecord
  validates :slug, uniqueness: true
end
