class Platform < ApplicationRecord
    belongs_to :users
    has_and_belongs_to_many :games
    scope :ordered_by_title, -> {order(title: :asc) }
end