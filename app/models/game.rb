class Game < ApplicationRecord
    has_many :reviews
    has_many :games_platforms
    has_many :platforms, through: :games_platforms
    has_many :users,  through: :reviews
    validates :title, presence: true, uniqueness: true
    scope :ordered_by_title, -> {order(title: :asc) }
end