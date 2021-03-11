class CreateChatMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_members do |t|
      
      t.references :user, null:false, foreign_key: true
      t.references :chatroom, null:false, foreign_key: true
      t.timestamps
    end
  end
end
