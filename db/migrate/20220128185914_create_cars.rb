class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :name, null: false
      t.integer :year, null: false
      t.integer :mpg, null: false
      t.integer :doors, null: false
      t.string :gas, null: false
      t.integer :seats, null: false
      t.text :description

      t.timestamps
    end
  end
end
