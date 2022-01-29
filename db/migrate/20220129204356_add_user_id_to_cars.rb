class AddUserIdToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :user_id, :integer
    add_index :cars, :user_id
  end
end
