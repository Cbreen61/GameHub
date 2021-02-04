class Game < ApplicationRecord
    has_and_belongs_to_many :platforms
    has_many :ratings
    has_many :users,  through: :rating
    validates :title, presence: true, uniqueness: true
end