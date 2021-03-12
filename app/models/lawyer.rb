class Lawyer < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  has_one_attached :photo

  validates :description, length: { maximum: 350,
  too_long: "%{count} characters is the maximum allowed" }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
