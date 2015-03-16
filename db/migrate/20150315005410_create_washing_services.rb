class CreateWashingServices < ActiveRecord::Migration
  def change
    create_table :washing_services do |t|
      t.string  :name
      t.text    :description
      t.decimal :price_large, precision: 5, scale: 2
      t.decimal :price_small, precision: 5, scale: 2
      t.integer :duration

      t.string  :child_class
      t.string  :washing_serviceable_type
      t.integer :washing_serviceable_id

      t.timestamps null: false
    end
    add_index :washing_services, :name
    add_index :washing_services, :description
    add_index :washing_services, :price_large
    add_index :washing_services, :price_small
    add_index :washing_services, :duration
  end
end
