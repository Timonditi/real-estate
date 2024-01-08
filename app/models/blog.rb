class Blog < ApplicationRecord
    belongs_to :user

    validates :title, presence: true, uniqueness: true
    validates :image, presence: true
    validates :content, presence: true
    validates :user_id, presence: true
end
