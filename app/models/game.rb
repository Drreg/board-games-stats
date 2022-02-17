class Game < ApplicationRecord
  belongs_to :store

  validates :name, presence: true
  validates :link, presence: true
end
