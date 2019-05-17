class Booking < ApplicationRecord
  belongs_to :instrument
  belongs_to :user
  has_many :reviews
end
