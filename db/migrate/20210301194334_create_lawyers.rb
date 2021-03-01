class CreateLawyers < ActiveRecord::Migration[6.0]
  def change
    create_table :lawyers do |t|
      t.string :name
      t.string :oab
      t.string :address
      t.string :phone
      t.string :area
      t.string :description

      t.timestamps
    end
  end
end
