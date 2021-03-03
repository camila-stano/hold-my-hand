class AddEmailToLawyers < ActiveRecord::Migration[6.0]
  def change
    add_column :lawyers, :email, :string
  end
end
