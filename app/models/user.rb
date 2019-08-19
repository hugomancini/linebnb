class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :queuers
  has_many :reservations
  has_many :reviews, through: :reservations
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
