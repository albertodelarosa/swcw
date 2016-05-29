class CreateVehicleSettings < ActiveRecord::Migration
  def change
    create_table :vehicle_settings do |t|
      t.belongs_to :vehicle,        index: true
      t.belongs_to :vehicle_year,   index: true
      t.belongs_to :vehicle_make,   index: true
      t.belongs_to :vehicle_model,  index: true
      t.belongs_to :vehicle_trim,   index: true
      t.belongs_to :vehicle_type,   index: true
      t.belongs_to :vehicle_door,   index: true
      t.belongs_to :vehicle_size,   index: true

      t.timestamps
    end

    add_index :vehicle_settings, [:vehicle_id, :vehicle_year_id]
    add_index :vehicle_settings, [:vehicle_id, :vehicle_make_id]
    add_index :vehicle_settings, [:vehicle_id, :vehicle_model_id]
    add_index :vehicle_settings, [:vehicle_id, :vehicle_trim_id]
    add_index :vehicle_settings, [:vehicle_id, :vehicle_type_id]
    add_index :vehicle_settings, [:vehicle_id, :vehicle_door_id]
    add_index :vehicle_settings, [:vehicle_id, :vehicle_size_id]

    add_index :vehicle_settings, [:vehicle_year_id, :vehicle_make_id]
    add_index :vehicle_settings, [:vehicle_year_id, :vehicle_model_id]
    add_index :vehicle_settings, [:vehicle_year_id, :vehicle_trim_id]
    add_index :vehicle_settings, [:vehicle_year_id, :vehicle_type_id]
    add_index :vehicle_settings, [:vehicle_year_id, :vehicle_door_id]
    add_index :vehicle_settings, [:vehicle_year_id, :vehicle_size_id]

    add_index :vehicle_settings, [:vehicle_make_id, :vehicle_model_id]
    add_index :vehicle_settings, [:vehicle_make_id, :vehicle_trim_id]
    add_index :vehicle_settings, [:vehicle_make_id, :vehicle_type_id]
    add_index :vehicle_settings, [:vehicle_make_id, :vehicle_door_id]
    add_index :vehicle_settings, [:vehicle_make_id, :vehicle_size_id]

    add_index :vehicle_settings, [:vehicle_model_id, :vehicle_trim_id]
    add_index :vehicle_settings, [:vehicle_model_id, :vehicle_type_id]
    add_index :vehicle_settings, [:vehicle_model_id, :vehicle_door_id]
    add_index :vehicle_settings, [:vehicle_model_id, :vehicle_size_id]

    add_index :vehicle_settings, [:vehicle_trim_id, :vehicle_type_id]
    add_index :vehicle_settings, [:vehicle_trim_id, :vehicle_door_id]
    add_index :vehicle_settings, [:vehicle_trim_id, :vehicle_size_id]

    add_index :vehicle_settings, [:vehicle_type_id, :vehicle_door_id]
    add_index :vehicle_settings, [:vehicle_type_id, :vehicle_size_id]

    add_index :vehicle_settings, [:vehicle_door_id, :vehicle_size_id]
  end
end
