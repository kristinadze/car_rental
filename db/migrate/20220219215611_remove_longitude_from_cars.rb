class RemoveLongitudeFromCars < ActiveRecord::Migration[5.2]
  def change
    remove_column :cars, :longitude, :decimal
  end
end
