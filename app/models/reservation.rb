class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :queuer
  has_many :reviews
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates :content, presence: true
  validates :address, presence: true
end
