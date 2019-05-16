class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
