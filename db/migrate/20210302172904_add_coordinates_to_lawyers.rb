class AddCoordinatesToLawyers < ActiveRecord::Migration[6.0]
  def change
    add_column :lawyers, :latitude, :float
    add_column :lawyers, :longitude, :float
  end
end
