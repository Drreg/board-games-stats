class Game < ApplicationRecord
  has_many :game_prices
  has_many :stores, through: :game_prices

  validates :name, presence: true
end
