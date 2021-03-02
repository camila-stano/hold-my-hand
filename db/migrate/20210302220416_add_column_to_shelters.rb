class AddColumnToShelters < ActiveRecord::Migration[6.0]
  def change
    add_column :shelters, :description, :text
    add_column :shelters, :opening_hours, :string
  end
end
