class User < ApplicationRecord
    has_many :blogs

    has_secure_password
end
