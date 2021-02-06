class OwnedGame < ApplicationRecord
    belongs_to :platform
    belongs_to :game
end