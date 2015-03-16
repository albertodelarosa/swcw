class CreateSitelerDollars < ActiveRecord::Migration
  def change
    create_table :siteler_dollars do |t|
      t.string :name,                         null: false, default: ""
      t.decimal :amount_paid,                 null: false, precision: 8, scale: 2, default: 0.0
      t.decimal :bonus_siteler_dollars,       null: false, precision: 8, scale: 2, default: 0.0
      t.decimal :percentage,                  null: false, precision: 4, scale: 2, default: 0.0
      t.decimal :total_siteler_dollars,       null: false, precision: 8, scale: 2, default: 0.0
      t.decimal :siteler_dollars_remaining,   null: false, precision: 8, scale: 2, default: 0.0

      t.timestamps null: false
    end
    add_index :siteler_dollars, :name
    add_index :siteler_dollars, :amount_paid
    add_index :siteler_dollars, :bonus_siteler_dollars
    add_index :siteler_dollars, :percentage
    add_index :siteler_dollars, :total_siteler_dollars
    add_index :siteler_dollars, :siteler_dollars_remaining
  end
end
