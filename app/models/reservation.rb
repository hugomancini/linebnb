class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :queuer, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates :content, presence: true
  validates :address, presence: true
end
