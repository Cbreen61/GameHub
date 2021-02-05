class Platform < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :games
    scope :ordered_by_title, -> {order(name: :asc) }
end