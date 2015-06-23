class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.datetime :purchased_at, index: true, null: false, default: "2015-01-01 00:00:00"

      t.timestamps null: false
    end
  end
end
