class Queuer < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :reviews, through: :reservationss, dependent: :destroy
  belongs_to :user

  validates :address, presence: true
  validates :description, presence: true
  validates :price_per_hour, presence: true
  validates :radius, presence: true
end
