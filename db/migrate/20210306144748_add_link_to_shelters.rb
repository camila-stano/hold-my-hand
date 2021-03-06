class AddLinkToShelters < ActiveRecord::Migration[6.0]
  def change
    add_column :shelters, :link, :string
  end
end
