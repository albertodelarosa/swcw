class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string  :name,            index: true, null: false, default: ""
      t.decimal :percentage,      index: true, null: false, default: 0.0, precision: 4, scale: 2
      t.boolean :applied,         index: true, null: false, default: false
      t.string  :transaction_id,  index: true, null: false, default: ""
      t.date    :expires,         index: true, null: false, default: "2015-01-01"
      t.boolean :expireable,      index: true, null: false, default: false
      t.belongs_to :account,      index: true

      t.timestamps null: false
    end
    add_index :discounts, [:name, :percentage]
    add_index :discounts, [:name, :applied]
    add_index :discounts, [:name, :transaction_id]
    add_index :discounts, [:name, :expires]
    add_index :discounts, [:name, :expireable]

    add_index :discounts, [:percentage, :applied]
    add_index :discounts, [:percentage, :transaction_id]
    add_index :discounts, [:percentage, :expires]
    add_index :discounts, [:percentage, :expireable]

    add_index :discounts, [:applied, :transaction_id]
    add_index :discounts, [:applied, :expires]
    add_index :discounts, [:applied, :expireable]

    add_index :discounts, [:transaction_id, :expires]
    add_index :discounts, [:transaction_id, :expireable]

    add_index :discounts, [:expires, :expireable]

    add_foreign_key :discounts, :accounts
  end
end

