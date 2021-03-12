class Review < ApplicationRecord
  belongs_to :user
  belongs_to :lawyer

  validates :rating, :content, presence: true
  validates :content, length: {minimum: 5}

end
