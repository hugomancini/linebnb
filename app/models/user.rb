class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :picture, PhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :queuers, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :reviews, through: :reservations
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
end
