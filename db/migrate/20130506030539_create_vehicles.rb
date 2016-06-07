class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :my_year,          length: 8,  null: false, default: "", index: true
      t.string :my_make,                      null: false, default: "", index: true
      t.string :my_model,                     null: false, default: "", index: true
      t.string :my_trim,                      null: false, default: "", index: true
      t.string :my_type,                      null: false, default: "", index: true
      t.string :my_door,                      null: false, default: "", index: true
      t.string :my_size,                      null: false, default: "", index: true
      t.string :license_plate,    length: 8,  null: false, default: "", index: true
      t.string :state_registered, length: 2,  null: false, default: "", index: true
      t.string :color,                        null: false, default: "", index: true
      t.text   :comments,                     null: false, default: "", index: true

      t.belongs_to :line_item,                index: true

      t.timestamps
    end
    add_index :vehicles, [:my_year, :my_make]
    add_index :vehicles, [:my_year, :my_model]
    add_index :vehicles, [:my_year, :my_trim]
    add_index :vehicles, [:my_year, :my_type]
    add_index :vehicles, [:my_year, :my_door]
    add_index :vehicles, [:my_year, :my_size]
    add_index :vehicles, [:my_year, :license_plate]
    add_index :vehicles, [:my_year, :state_registered]
    add_index :vehicles, [:my_year, :color]

    add_index :vehicles, [:my_make, :my_model]
    add_index :vehicles, [:my_make, :my_trim]
    add_index :vehicles, [:my_make, :my_type]
    add_index :vehicles, [:my_make, :my_door]
    add_index :vehicles, [:my_make, :my_size]
    add_index :vehicles, [:my_make, :license_plate]
    add_index :vehicles, [:my_make, :state_registered]
    add_index :vehicles, [:my_make, :color]

    add_index :vehicles, [:my_model, :my_trim]
    add_index :vehicles, [:my_model, :my_type]
    add_index :vehicles, [:my_model, :my_door]
    add_index :vehicles, [:my_model, :my_size]
    add_index :vehicles, [:my_model, :license_plate]
    add_index :vehicles, [:my_model, :state_registered]
    add_index :vehicles, [:my_model, :color]

    add_index :vehicles, [:my_trim, :my_type]
    add_index :vehicles, [:my_trim, :my_door]
    add_index :vehicles, [:my_trim, :my_size]
    add_index :vehicles, [:my_trim, :license_plate]
    add_index :vehicles, [:my_trim, :state_registered]
    add_index :vehicles, [:my_trim, :color]

    add_index :vehicles, [:my_type, :my_door]
    add_index :vehicles, [:my_type, :my_size]
    add_index :vehicles, [:my_type, :license_plate]
    add_index :vehicles, [:my_type, :state_registered]
    add_index :vehicles, [:my_type, :color]

    add_index :vehicles, [:my_door, :my_size]
    add_index :vehicles, [:my_door, :license_plate]
    add_index :vehicles, [:my_door, :state_registered]
    add_index :vehicles, [:my_door, :color]

    add_index :vehicles, [:my_size, :license_plate]
    add_index :vehicles, [:my_size, :state_registered]
    add_index :vehicles, [:my_size, :color]

    add_index :vehicles, [:license_plate, :state_registered]
    add_index :vehicles, [:license_plate, :color]

    add_index :vehicles, [:state_registered, :color]
  end
end
