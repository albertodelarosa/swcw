class CreateOrderTransactions < ActiveRecord::Migration
  def change
    create_table :order_transactions do |t|
      t.integer :order_id,      index: true, null: false, default: 0
      t.string  :action,        index: true, null: false, default: ""
      t.integer :amount,        index: true, null: false, default: 0
      t.boolean :success,       index: true, null: false, default: false
      t.string  :authorization, index: true, null: false, default: ""
      t.string  :message,       index: true, null: false, default: ""
      t.text    :params,        index: true, null: false, default: ""

      t.timestamps null: false
    end
    add_index :order_transactions, [:order_id, :action]
    add_index :order_transactions, [:order_id, :amount]
    add_index :order_transactions, [:order_id, :success]
    add_index :order_transactions, [:order_id, :authorization]
    add_index :order_transactions, [:order_id, :message]
    add_index :order_transactions, [:order_id, :params]

    add_index :order_transactions, [:action, :amount]
    add_index :order_transactions, [:action, :success]
    add_index :order_transactions, [:action, :authorization]
    add_index :order_transactions, [:action, :message]
    add_index :order_transactions, [:action, :params]

    add_index :order_transactions, [:amount, :success]
    add_index :order_transactions, [:amount, :authorization]
    add_index :order_transactions, [:amount, :message]
    add_index :order_transactions, [:amount, :params]

    add_index :order_transactions, [:success, :authorization]
    add_index :order_transactions, [:success, :message]
    add_index :order_transactions, [:success, :params]

    add_index :order_transactions, [:authorization, :message]
    add_index :order_transactions, [:authorization, :params]

    add_index :order_transactions, [:message, :params]
  end
end
