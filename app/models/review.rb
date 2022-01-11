class Review < ApplicationRecord
  belongs_to :list
  belongs_to :user
   validates :comment, presence: true

   def blank_stars
    5 - rating.to_i
  end
end
