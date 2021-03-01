class CreateComunications < ActiveRecord::Migration[6.0]
  def change
    create_table :comunications do |t|
      t.string :expression
      t.string :translation

      t.timestamps
    end
  end
end
