class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :license_plate_number, length: 8
      t.string :state_registered,     length: 2
      t.string :color
      t.text   :comments

      t.timestamps
    end
  end
end
