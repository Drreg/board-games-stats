class GamePrice < ApplicationRecord
  belongs_to :game
  belongs_to :store

  validates :price, presence: true
end
