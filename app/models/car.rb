class Car < ApplicationRecord
    validates :name, :year, :mpg, :doors, :gas, :seats, presence: true

    has_many :rental_requests,
        class_name: :CarRentalRequest,
        dependent: :destroy

    belongs_to :owner,
        class_name: 'User',
        foreign_key: :user_id

    has_one_attached :image, :dependent => :destroy

end