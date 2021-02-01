class Game < ApplicationRecord
    has_and_belongs_to_many :plaforms
    has_many :ratings
end