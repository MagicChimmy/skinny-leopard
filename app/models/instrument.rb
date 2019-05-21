class Instrument < ApplicationRecord
  include PgSearch
  belongs_to :user
  validates :location, presence: true
  validates :name, presence: true
  validates :category, presence: true
  validates :price, presence: true
  mount_uploader :photo, PhotoUploader
  validates :photo, presence: true
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy

  pg_search_scope :search_by_name_and_location_and_category,
    against: [:name, :location, :category],
    using: {
      tsearch: { prefix: true }
    }
end
