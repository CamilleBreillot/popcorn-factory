class Movie < ApplicationRecord
  validates :title, uniqueness: true
  validates :overview, presence: true
end
