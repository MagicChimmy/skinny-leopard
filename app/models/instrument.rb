class Instrument < ApplicationRecord
  belongs_to :user
  validates :location, presence: true
  validates :name, presence: true
  validates :photo, presence: true
  validates :price, presence: true

  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_attachment :photo
end
