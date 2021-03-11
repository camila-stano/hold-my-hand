class Review < ApplicationRecord
  belongs_to :user
  belongs_to :lawyer

  validates :rating, presence: true
  validates :content, length: {maximum: 700}
  
  
end
