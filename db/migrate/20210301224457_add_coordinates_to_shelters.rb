class AddCoordinatesToShelters < ActiveRecord::Migration[6.0]
  def change
    add_column :shelters, :latitude, :float
    add_column :shelters, :longitude, :float
  end
end
