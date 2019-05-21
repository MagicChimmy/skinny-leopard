class Instrument < ApplicationRecord
  belongs_to :user
  validates :location, presence: true
  validates :name, presence: true
  validates :category, presence: true
  validates :price, presence: true
  mount_uploader :photo, PhotoUploader
  validates :photo, presence: true
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  # has_attachment :photo
end
