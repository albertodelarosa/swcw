class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string :name
      t.decimal :percentage
      t.boolean :applied
      t.string :transaction_id

      t.timestamps null: false
    end
    add_index :discounts, :name
    add_index :discounts, :percentage
    add_index :discounts, :applied
    add_index :discounts, :transaction_id
  end
end
