class CreateVehicleSizes < ActiveRecord::Migration
  def change
    create_table :vehicle_sizes do |t|
      t.string :name, index: true

      t.timestamps
    end
  end
end
