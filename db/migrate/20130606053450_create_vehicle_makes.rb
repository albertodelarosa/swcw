class CreateVehicleMakes < ActiveRecord::Migration
  def change
    create_table :vehicle_makes do |t|
      t.string :name, null: false, default: "", index: true

      t.timestamps
    end
  end
end
