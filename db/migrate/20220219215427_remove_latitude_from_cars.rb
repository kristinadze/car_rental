class RemoveLatitudeFromCars < ActiveRecord::Migration[5.2]
  def change
    remove_column :cars, :latitude, :decimal
  end
end
