class CreateVehicleYears < ActiveRecord::Migration
  def change
    create_table :vehicle_years do |t|
      t.string :name

      t.timestamps
    end
  end
end
