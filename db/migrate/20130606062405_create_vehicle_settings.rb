class CreateVehicleSettings < ActiveRecord::Migration
  def change
    create_table :vehicle_settings do |t|
      t.belongs_to :vehicle
      t.belongs_to :vehicle_type
      t.belongs_to :vehicle_door
      t.belongs_to :vehicle_size

      t.timestamps
    end
    add_index :vehicle_settings, :vehicle_id
    add_index :vehicle_settings, :vehicle_type_id
    add_index :vehicle_settings, :vehicle_door_id
    add_index :vehicle_settings, :vehicle_size_id

    add_index :vehicle_settings, [:vehicle_id,  :vehicle_type_id]
    add_index :vehicle_settings, [:vehicle_id,  :vehicle_door_id]
    add_index :vehicle_settings, [:vehicle_id,  :vehicle_size_id]

    add_index :vehicle_settings, [:vehicle_type_id,  :vehicle_door_id]
    add_index :vehicle_settings, [:vehicle_type_id,  :vehicle_size_id]

    add_index :vehicle_settings, [:vehicle_door_id,  :vehicle_size_id]
  end
end
