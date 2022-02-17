class CreateGamePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :game_prices do |t|
      t.decimal :price, precision: 10, scale: 2, null: false
      t.references :game
      t.references :store

      t.timestamps
    end
  end
end
