class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.string :link, null: false
      t.decimal :current_price, precision: 10, scale: 2
      t.references :store

      t.timestamps
    end
  end
end
