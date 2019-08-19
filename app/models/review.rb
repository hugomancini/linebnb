class Review < ApplicationRecord
  belongs_to :reservation
  belongs_to :user

<<<<<<< HEAD
  RATING = [0, 1, 2, 3, 4, 5]
  validates :content, presence: true
  validates :rating, presence: true, inclusion: {in: RATING}
=======
  validates :user, :reservation, :content, :rating, presence: true
>>>>>>> c5e57d8a0aa4a2eb0105ec607ca47b4e7a8abd27
end
