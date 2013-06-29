class CreateVehicleSettings < ActiveRecord::Migration
  def change
    create_table :vehicle_settings do |t|
      t.belongs_to :vehicle
      t.belongs_to :vehicle_year
      t.belongs_to :vehicle_make
      t.belongs_to :vehicle_model
      t.belongs_to :vehicle_trim
      t.belongs_to :vehicle_type
      t.belongs_to :vehicle_door
      t.belongs_to :vehicle_size

      t.timestamps
    end
    add_index :vehicle_settings, :vehicle_id
    add_index :vehicle_settings, :vehicle_year_id
    add_index :vehicle_settings, :vehicle_make_id
    add_index :vehicle_settings, :vehicle_model_id
    add_index :vehicle_settings, :vehicle_trim_id
    add_index :vehicle_settings, :vehicle_type_id
    add_index :vehicle_settings, :vehicle_door_id
    add_index :vehicle_settings, :vehicle_size_id

    add_index :vehicle_settings, [:vehicle_id,  :vehicle_year_id]
    add_index :vehicle_settings, [:vehicle_id,  :vehicle_make_id]
    add_index :vehicle_settings, [:vehicle_id,  :vehicle_model_id]
    add_index :vehicle_settings, [:vehicle_id,  :vehicle_trim_id]
    add_index :vehicle_settings, [:vehicle_id,  :vehicle_type_id]
    add_index :vehicle_settings, [:vehicle_id,  :vehicle_door_id]
    add_index :vehicle_settings, [:vehicle_id,  :vehicle_size_id]

    add_index :vehicle_settings, [:vehicle_make_id,  :vehicle_model_id]
    add_index :vehicle_settings, [:vehicle_model_id, :vehicle_trim_id]
    add_index :vehicle_settings, [:vehicle_trim_id,  :vehicle_year_id]
    add_index :vehicle_settings, [:vehicle_trim_id,  :vehicle_type_id]
    add_index :vehicle_settings, [:vehicle_door_id,  :vehicle_type_id]
    add_index :vehicle_settings, [:vehicle_size_id,  :vehicle_type_id]
  end
end
