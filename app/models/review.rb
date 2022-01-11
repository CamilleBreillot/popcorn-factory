class Review < ApplicationRecord
  belongs_to :list
  belongs_to :user
   validates :comment, presence: true
end
