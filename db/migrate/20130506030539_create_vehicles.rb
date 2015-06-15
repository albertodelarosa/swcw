class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :vehicle_year,     length: 8,  null: false, default: ""
      t.string :vehicle_make,                 null: false, default: ""
      t.string :vehicle_model,                null: false, default: ""
      t.string :vehicle_trim,                 null: false, default: ""
      t.string :vehicle_type,                 null: false, default: ""
      t.string :vehicle_door,                 null: false, default: ""
      t.string :vehicle_size,                 null: false, default: ""
      t.string :license_plate,    length: 8,  null: false, default: ""
      t.string :state_registered, length: 2,  null: false, default: ""
      t.string :color,                        null: false, default: ""
      t.text   :comments,                     null: false, default: ""

      t.timestamps
    end
    add_index :vehicles, :vehicle_year
    add_index :vehicles, :vehicle_make
    add_index :vehicles, :vehicle_model
    add_index :vehicles, :vehicle_trim
    add_index :vehicles, :vehicle_type
    add_index :vehicles, :vehicle_door
    add_index :vehicles, :vehicle_size
    add_index :vehicles, :license_plate
    add_index :vehicles, :state_registered
    add_index :vehicles, :color
    add_index :vehicles, :comments
  end
end
