class CreateStockCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_categories do |t|
      t.integer :stock_id
      t.integer :category_id

      t.timestamps
    end
  end
end
