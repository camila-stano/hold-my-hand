class CreateEducations < ActiveRecord::Migration[6.0]
  def change
    create_table :educations do |t|
      t.string :language
      t.string :openning_hours
      t.string :address
      t.string :instituition
      t.string :contact
      t.string :url_instituition

      t.timestamps
    end
  end
end
