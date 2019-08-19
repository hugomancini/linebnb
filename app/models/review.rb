class Review < ApplicationRecord
  belongs_to :reservation
  belongs_to :user

  validates :user, :reservation, :content, :rating, presence: true
end
