class Car < ApplicationRecord
    validates :name, :year, :mpg, :doors, :gas, :seats, presence: true
end