class Platform < ApplicationRecord
    belongs_to :users
    has_and_belongs_to_many :games
end