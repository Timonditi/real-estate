class Property < ApplicationRecord
    belongs_to :user

    validates :title, presence: true, uniqueness: true
    validates :image, presence: true
    validates :description, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :bedrooms, presence: true
    validates :location, presence: true
end
