class Lawyer < ApplicationRecord
  has_many :reviews
  has_one_attached :photo

  validates :description, length: { maximum: 350,
  too_long: "%{count} characters is the maximum allowed" }
end
