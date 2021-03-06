class AddDescriptionToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :description, :string
  end
end
