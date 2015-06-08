class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.datetime :purchased_at

      t.timestamps null: false
    end
    add_index :carts, :purchased_at
  end
end
