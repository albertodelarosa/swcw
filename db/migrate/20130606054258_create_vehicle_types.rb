class CreateVehicleTypes < ActiveRecord::Migration
  def change
    create_table :vehicle_types do |t|
      t.string :name, null: false, default: "", index: true

      t.timestamps
    end
  end
end
