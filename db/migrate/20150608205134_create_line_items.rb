class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.decimal     :unit_price,   index: true, null: false, default: 0.0
      t.integer     :quantity,     index: true, null: false, default: 0
      t.belongs_to  :cart,         index: true
      t.belongs_to  :service_plan, index: true

      t.timestamps null: false
    end
    add_index :line_items, [:unit_price, :quantity]

    add_foreign_key :line_items, :carts
    add_foreign_key :line_items, :service_plans
  end
end
