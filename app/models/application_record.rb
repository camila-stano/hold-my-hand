class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
