class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string  :name
      t.text    :description
      t.decimal :price, precision: 8, scale: 2
      t.integer :duration
      t.belongs_to :service_plan, index: true

      t.string  :child_class
      t.string  :washing_serviceable_type
      t.integer :washing_serviceable_id

      t.timestamps null: false
    end
    add_index :services, :name
    add_index :services, :description
    add_index :services, :price
    add_index :services, :duration
    add_foreign_key :services, :service_plans
  end
end
