class AddColumnToLawyers < ActiveRecord::Migration[6.0]
  def change
    add_column :lawyers, :available, :boolean, default: false
  end
end
