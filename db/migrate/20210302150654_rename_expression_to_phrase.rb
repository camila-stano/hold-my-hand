class RenameExpressionToPhrase < ActiveRecord::Migration[6.0]
  def change
    rename_column :communications, :expression, :phrase
  end
end
