class Review < ApplicationRecord
  belongs_to :user
  belongs_to :lawyer

  validates :rating, presence: true
end
