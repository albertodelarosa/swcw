class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :cart_id
      t.string :ip_address
      t.string :first_name
      t.string :last_name
      t.string :card_type
      t.date :card_expires_on

      t.timestamps null: false
    end
    add_index :orders, :ip_address
    add_index :orders, :first_name
    add_index :orders, :last_name
    add_index :orders, :card_type
    add_index :orders, :card_expires_on
  end
end
