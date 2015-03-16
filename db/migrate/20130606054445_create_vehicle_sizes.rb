class CreateVehicleSizes < ActiveRecord::Migration
  def change
    create_table :vehicle_sizes do |t|
      t.string :name

      t.timestamps
    end
    add_index :vehicle_sizes, :name
  end
end
