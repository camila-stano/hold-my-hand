class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  GENDER = ['Woman', 'Men', 'Other']
end
