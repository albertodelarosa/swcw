class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      #t.string :vehicle_year, length: 4
      #t.string :vehicle_make
      #t.string :vehicle_model
      #t.string :vehicle_trim
      #t.string :vehicle_type    #suv/crossover, sedan, coupe, hatchback, convertible, pickup, truck, van, minivan, cargovan, hybrid
      #t.string :vehicle_doors   #2-door, 3-door,4-door,5-door
      #t.string :size    #small, large
      t.string :license_plate_number, length: 8
      t.string :state_registered,     length: 2
      t.string :color
      t.text   :comments

      t.timestamps
    end
  end
end
