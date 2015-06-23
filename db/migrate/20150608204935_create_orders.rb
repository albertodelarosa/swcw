class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :cart_id,         index: true, null: false, default: 0
      t.string  :ip_address,      index: true, null: false, default: ""
      t.string  :first_name,      index: true, null: false, default: ""
      t.string  :last_name,       index: true, null: false, default: ""
      t.string  :card_type,       index: true, null: false, default: ""
      t.date    :card_expires_on, index: true, null: false, default: "2015-01-01"

      t.timestamps null: false
    end
    add_index :orders, [:cart_id, :ip_address]
    add_index :orders, [:cart_id, :first_name]
    add_index :orders, [:cart_id, :last_name]
    add_index :orders, [:cart_id, :card_type]
    add_index :orders, [:cart_id, :card_expires_on]

    add_index :orders, [:ip_address, :first_name]
    add_index :orders, [:ip_address, :last_name]
    add_index :orders, [:ip_address, :card_type]
    add_index :orders, [:ip_address, :card_expires_on]

    add_index :orders, [:first_name, :last_name]
    add_index :orders, [:first_name, :card_type]
    add_index :orders, [:first_name, :card_expires_on]

    add_index :orders, [:last_name, :card_type]
    add_index :orders, [:last_name, :card_expires_on]

    add_index :orders, [:card_type, :card_expires_on]
  end
end
