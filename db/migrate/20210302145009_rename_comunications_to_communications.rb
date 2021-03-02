class RenameComunicationsToCommunications < ActiveRecord::Migration[6.0]
  def change
    rename_table :comunications, :communications
  end
end
