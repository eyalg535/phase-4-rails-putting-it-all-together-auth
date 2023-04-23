class Recipe < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :instructions, presence: true, length: { minimum: 50, message: "is too short (minimum is 50 characters)" }
end
