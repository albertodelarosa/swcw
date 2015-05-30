class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string  :name,            null: false, default: ""
      t.decimal :percentage,      null: false, precision: 4, scale: 2, default: 0.0
      t.boolean :applied,         null: false, default: false
      t.string  :transaction_id,  null: false, default: ""
      t.date    :expires,         null: false, default: "2015-01-01"
      t.boolean :expireable,      null: false, default: false
      t.belongs_to :account, index: true

      t.timestamps null: false
    end
    add_index :discounts, :name
    add_index :discounts, :percentage
    add_index :discounts, :applied
    add_index :discounts, :transaction_id
    add_index :discounts, :expires
    add_index :discounts, :expireable
    add_foreign_key :discounts, :accounts
  end
end

