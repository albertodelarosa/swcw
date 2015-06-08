class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.decimal :unit_price
      t.integer :product_id
      t.integer :cart_id
      t.integer :quantity

      t.timestamps null: false
    end
    add_index :line_items, :unit_price
    add_index :line_items, :product_id
    add_index :line_items, :cart_id
    add_index :line_items, :quantity
  end
end
