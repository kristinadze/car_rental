class CreateCarRentalRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :car_rental_requests do |t|
      t.integer :car_id, null: false 
      t.date :end_date, null: false 
      t.date :start_date, null: false
      t.string :status, null: false

      t.timestamps
    end
    
    add_index :car_rental_requests, :car_id
  end
end
