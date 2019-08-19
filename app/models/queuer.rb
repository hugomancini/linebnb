class Queuer < ApplicationRecord
  has_many :reservations
  has_many :reviews, :through :reservations

  validates :address, presence: true
  validates :description, presence: true
  validates :price_per_hour, presence: true
  validates :radius, presence: true
end
