class Review < ApplicationRecord
  belongs_to :reservation
  belongs_to :user

  RATING = [0, 1, 2, 3, 4, 5]
  validates :content, presence: true
  validates :rating, presence: true, inclusion: {in: RATING}

  validates :user, :reservation, :content, :rating, presence: true
end
