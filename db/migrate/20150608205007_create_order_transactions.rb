class CreateOrderTransactions < ActiveRecord::Migration
  def change
    create_table :order_transactions do |t|
      t.integer :order_id
      t.string :action
      t.integer :amount
      t.boolean :success
      t.string :authorization
      t.string :message
      t.text :params

      t.timestamps null: false
    end
    add_index :order_transactions, :order_id
    add_index :order_transactions, :action
    add_index :order_transactions, :amount
    add_index :order_transactions, :success
    add_index :order_transactions, :authorization
    add_index :order_transactions, :message
    add_index :order_transactions, :params
  end
end
