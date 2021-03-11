class AddDirectToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :direct, :boolean, default: false, null: false
  end
end
