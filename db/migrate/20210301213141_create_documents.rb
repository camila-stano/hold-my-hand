class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :document_type
      t.string :public_agency
      t.string :address
      t.string :contact
      t.string :opening_hours
      t.string :required_docs
      t.string :url_agency

      t.timestamps
    end
  end
end
