class Shelter < ApplicationRecord
  has_one_attached :photo
  has_one_attached :map

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
