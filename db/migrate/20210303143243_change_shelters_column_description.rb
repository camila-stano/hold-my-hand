class ChangeSheltersColumnDescription < ActiveRecord::Migration[6.0]
  def change
    change_column :shelters, :description, :text
  end
end
