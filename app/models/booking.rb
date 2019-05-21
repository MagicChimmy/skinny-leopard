class Booking < ApplicationRecord
  belongs_to :instrument
  belongs_to :user
  has_one :review, dependent: :destroy
end
