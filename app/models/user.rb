class User < ApplicationRecord
    has_many :platforms
    has_many :games, through: :plaforms
    has_many :ratings, through: :games
end