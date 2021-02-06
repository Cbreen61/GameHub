class Game < ApplicationRecord
    has_many :reviews
    has_many :owned_games
    has_many :platforms, through: :owned_games
    has_many :users,  through: :reviews
    validates :title, presence: true, uniqueness: true
    scope :ordered_by_title, -> {order(title: :asc) }
end