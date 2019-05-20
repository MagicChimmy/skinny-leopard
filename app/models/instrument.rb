class Instrument < ApplicationRecord
  belongs_to :user
  validates :location, presence: true
  validates :name, presence: true

  validates :price, presence: true
  mount_uploader :photo, PhotoUploader
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  # has_attachment :photo
end
