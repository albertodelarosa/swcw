class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string  :name,            index: true, null: false, default: ""
      t.text    :description,     index: true
      t.decimal :price,           index: true, null: false, default: 0.0, precision: 8, scale: 2
      t.decimal :small_price,     index: true, null: false, default: 0.0, precision: 8, scale: 2
      t.decimal :large_price,     index: true, null: false, default: 0.0, precision: 8, scale: 2
      t.integer :duration,        index: true, null: false, default: 0
      t.belongs_to :service_plan

      t.string  :child_class
      t.string  :washing_serviceable_type
      t.integer :washing_serviceable_id

      t.timestamps null: false
    end
    add_index :services, [:name, :description]
    add_index :services, [:name, :price]
    add_index :services, [:name, :small_price]
    add_index :services, [:name, :large_price]
    add_index :services, [:name, :duration]

    add_index :services, [:description, :price]
    add_index :services, [:description, :small_price]
    add_index :services, [:description, :large_price]
    add_index :services, [:description, :duration]

    add_index :services, [:price, :small_price]
    add_index :services, [:price, :large_price]
    add_index :services, [:price, :duration]

    add_index :services, [:small_price, :large_price]
    add_index :services, [:small_price, :duration]

    add_index :services, [:large_price, :duration]

    add_foreign_key :services, :service_plans
  end
end
