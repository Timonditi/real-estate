class Property < ApplicationRecord
    has_many :users

    validates :title, presence: true, uniqueness: true
    validates :image, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :bedrooms, presence: true
    validates :location, presence: true
end
