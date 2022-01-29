class AddUserIdToCarRentalRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :car_rental_requests, :user_id, :integer
    add_index :car_rental_requests, :user_id
  end
end
