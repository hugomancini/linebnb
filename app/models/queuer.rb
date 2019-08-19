class Queuer < ApplicationRecord
  has_many :reservations
  has_many :reviews, through: :reservationss
  belongs_to :user

  validates :address, presence: true
  validates :description, presence: true
  validates :price_per_hour, presence: true
  validates :radius, presence: true
end
