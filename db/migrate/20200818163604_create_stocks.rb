class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.date :action_date
      t.string :name
      t.string :ticker
      t.decimal :price
      t.decimal :cost
      t.decimal :shares
      t.decimal :market_value
      t.decimal :stock_return
      t.integer :user_id

      t.timestamps
    end
  end
end
