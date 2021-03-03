class Lawyer < ApplicationRecord
  has_many :reviews
  has_one_attached :photo
end
