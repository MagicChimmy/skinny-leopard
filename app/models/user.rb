class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  has_many :instruments, dependent: :destroy
  has_many :bookings
  has_many :reviews, through: :bookings
end
