class CreateSitlerDollars < ActiveRecord::Migration
  def change
    create_table :sitler_dollars do |t|
      t.string :name
      t.decimal :amount_paid
      t.decimal :bonus_siteler_dollars
      t.decimal :percentage
      t.decimal :total_siteler_dollars
      t.decimal :siteler_dollars_remaining

      t.timestamps null: false
    end
    add_index :sitler_dollars, :name
    add_index :sitler_dollars, :amount_paid
    add_index :sitler_dollars, :bonus_siteler_dollars
    add_index :sitler_dollars, :percentage
    add_index :sitler_dollars, :total_siteler_dollars
    add_index :sitler_dollars, :siteler_dollars_remaining
  end
end
