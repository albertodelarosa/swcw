class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.datetime :purchased_at, index: true

      t.timestamps null: false
    end
  end
end
