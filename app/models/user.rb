class User < ApplicationRecord
    has_many :platforms
    has_many :rating
    has_many :games, through: :plaforms
    has_many :games, through: :rating
end