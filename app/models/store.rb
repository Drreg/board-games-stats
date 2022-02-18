class Store < ApplicationRecord
  has_many :game_prices
  has_many :games, through: :game_prices

  validates :name, presence: true, uniqueness: true
  validates :link, presence: true, uniqueness: true
end
