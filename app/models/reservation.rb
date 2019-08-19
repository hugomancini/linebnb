class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :queuer
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates :content, presence: true
  validates :adress, presence: true
end
