class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :vehicle_year,     length: 8,  null: false, default: "", index: true
      t.string :vehicle_make,                 null: false, default: "", index: true
      t.string :vehicle_model,                null: false, default: "", index: true
      t.string :vehicle_trim,                 null: false, default: "", index: true
      t.string :vehicle_type,                 null: false, default: "", index: true
      t.string :vehicle_door,                 null: false, default: "", index: true
      t.string :vehicle_size,                 null: false, default: "", index: true
      t.string :license_plate,    length: 8,  null: false, default: "", index: true
      t.string :state_registered, length: 2,  null: false, default: "", index: true
      t.string :color,                        null: false, default: "", index: true
      t.text   :comments,                     null: false, default: "", index: true

      t.timestamps
    end
    add_index :vehicles, [:vehicle_year, :vehicle_make]
    add_index :vehicles, [:vehicle_year, :vehicle_model]
    add_index :vehicles, [:vehicle_year, :vehicle_trim]
    add_index :vehicles, [:vehicle_year, :vehicle_type]
    add_index :vehicles, [:vehicle_year, :vehicle_door]
    add_index :vehicles, [:vehicle_year, :vehicle_size]
    add_index :vehicles, [:vehicle_year, :license_plate]
    add_index :vehicles, [:vehicle_year, :state_registered]
    add_index :vehicles, [:vehicle_year, :color]

    add_index :vehicles, [:vehicle_make, :vehicle_model]
    add_index :vehicles, [:vehicle_make, :vehicle_trim]
    add_index :vehicles, [:vehicle_make, :vehicle_type]
    add_index :vehicles, [:vehicle_make, :vehicle_door]
    add_index :vehicles, [:vehicle_make, :vehicle_size]
    add_index :vehicles, [:vehicle_make, :license_plate]
    add_index :vehicles, [:vehicle_make, :state_registered]
    add_index :vehicles, [:vehicle_make, :color]

    add_index :vehicles, [:vehicle_model, :vehicle_trim]
    add_index :vehicles, [:vehicle_model, :vehicle_type]
    add_index :vehicles, [:vehicle_model, :vehicle_door]
    add_index :vehicles, [:vehicle_model, :vehicle_size]
    add_index :vehicles, [:vehicle_model, :license_plate]
    add_index :vehicles, [:vehicle_model, :state_registered]
    add_index :vehicles, [:vehicle_model, :color]

    add_index :vehicles, [:vehicle_trim, :vehicle_type]
    add_index :vehicles, [:vehicle_trim, :vehicle_door]
    add_index :vehicles, [:vehicle_trim, :vehicle_size]
    add_index :vehicles, [:vehicle_trim, :license_plate]
    add_index :vehicles, [:vehicle_trim, :state_registered]
    add_index :vehicles, [:vehicle_trim, :color]

    add_index :vehicles, [:vehicle_type, :vehicle_door]
    add_index :vehicles, [:vehicle_type, :vehicle_size]
    add_index :vehicles, [:vehicle_type, :license_plate]
    add_index :vehicles, [:vehicle_type, :state_registered]
    add_index :vehicles, [:vehicle_type, :color]

    add_index :vehicles, [:vehicle_door, :vehicle_size]
    add_index :vehicles, [:vehicle_door, :license_plate]
    add_index :vehicles, [:vehicle_door, :state_registered]
    add_index :vehicles, [:vehicle_door, :color]

    add_index :vehicles, [:vehicle_size, :license_plate]
    add_index :vehicles, [:vehicle_size, :state_registered]
    add_index :vehicles, [:vehicle_size, :color]

    add_index :vehicles, [:license_plate, :state_registered]
    add_index :vehicles, [:license_plate, :color]

    add_index :vehicles, [:state_registered, :color]
  end
end
