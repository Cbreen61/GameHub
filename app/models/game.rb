class Game < ApplicationRecord
    has_and_belongs_to_many :plaforms
    has_many :ratings
    validates :title, presence: true
end