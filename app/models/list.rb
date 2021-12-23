class List < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :reviews
  validates :name, uniqueness: true, presence: true
  has_one_attached :photo
end
