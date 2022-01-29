class Car < ApplicationRecord
    validates :name, :year, :mpg, :doors, :gas, :seats, presence: true

    has_many :rental_requests,
    class_name: :CarRentalRequest,
    dependent: :destroy

end