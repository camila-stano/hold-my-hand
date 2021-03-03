class ChangeLawyerColumnDescription < ActiveRecord::Migration[6.0]
  def change
    change_column :lawyers, :description, :text
  end
end
