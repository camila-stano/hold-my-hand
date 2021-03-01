class AddCoordinatesToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :latitude, :float
    add_column :documents, :longitude, :float
  end
end
