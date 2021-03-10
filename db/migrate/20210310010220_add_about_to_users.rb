class AddAboutToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :about, :text
    add_column :users, :document, :boolean, default: :false
    add_column :users, :studying_pt, :boolean, default: :false
    add_column :users, :got_job, :boolean, default: :false
    add_column :users, :arrived, :date
  end
end
