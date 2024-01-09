class User < ApplicationRecord
    has_many :blogs
    has_many :properties

    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :profile_image, presence: true
    validates :phone_number, presence: true
    validates :password, presence: true
end
