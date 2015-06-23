class CreateSitelerDollars < ActiveRecord::Migration
  def change
    create_table :siteler_dollars do |t|
      t.string  :name,        index: true, null: false, default: ""
      t.decimal :amount_paid, index: true, null: false, precision: 8, scale: 2, default: 0.00
      t.decimal :bonus,       index: true, null: false, precision: 8, scale: 2, default: 0.00
      t.decimal :percentage,  index: true, null: false, precision: 4, scale: 2, default: 0.00
      t.decimal :total,       index: true, null: false, precision: 8, scale: 2, default: 0.00
      t.decimal :remaining,   index: true, null: false, precision: 8, scale: 2, default: 0.00
      t.belongs_to :account,  index: true

      t.timestamps null: false
    end
    add_index :siteler_dollars, [:name, :amount_paid]
    add_index :siteler_dollars, [:name, :bonus]
    add_index :siteler_dollars, [:name, :percentage]
    add_index :siteler_dollars, [:name, :total]
    add_index :siteler_dollars, [:name, :remaining]

    add_index :siteler_dollars, [:amount_paid, :bonus]
    add_index :siteler_dollars, [:amount_paid, :percentage]
    add_index :siteler_dollars, [:amount_paid, :total]
    add_index :siteler_dollars, [:amount_paid, :remaining]

    add_index :siteler_dollars, [:bonus, :percentage]
    add_index :siteler_dollars, [:bonus, :total]
    add_index :siteler_dollars, [:bonus, :remaining]

    add_index :siteler_dollars, [:percentage, :total]
    add_index :siteler_dollars, [:percentage, :remaining]

    add_index :siteler_dollars, [:total, :remaining]

    add_foreign_key :siteler_dollars, :accounts
  end
end

