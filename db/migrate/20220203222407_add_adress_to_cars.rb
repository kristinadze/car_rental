class AddAdressToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :address, :string, null: false
  end
end
