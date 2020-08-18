class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.decimal :price
      t.decimal :cost
      t.decimal :shares

      t.timestamps
    end
  end
end
