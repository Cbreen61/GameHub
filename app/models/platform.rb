class Platform < ApplicationRecord
    belongs_to :user
    has_many :games_platforms
    has_many :games, through: :games_platforms
    scope :ordered_by_title, -> {order(name: :asc) }
end