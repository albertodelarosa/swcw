class CreateVehicleDoors < ActiveRecord::Migration
  def change
    create_table :vehicle_doors do |t|
      t.string :name,   null: false, default: ""

      t.timestamps
    end
    add_index :vehicle_doors, :name
  end
end
