class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :year
      t.string :color
      t.string :doors
      t.string :license_plate_number
      t.string :comments
      t.string :size
      t.string :state_registered

      t.timestamps
    end
  end
end
