class Queuer < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :reviews, through: :reservations, dependent: :destroy
  belongs_to :user

  validates :address, presence: true
  validates :description, presence: true
  validates :price_per_hour, presence: true
  validates :radius, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
