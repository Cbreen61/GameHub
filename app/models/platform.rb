class Platform < ApplicationRecord
    belongs_to :user
    has_many :owned_games
    has_many :games, through: :owned_games
    scope :ordered_by_title, -> {order(name: :asc) }
end