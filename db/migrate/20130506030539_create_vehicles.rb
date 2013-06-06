class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :year, length: 4
      t.string :make
      t.string :model
      t.string :trim
      t.string :type    #suv/crossover, sedan, coupe, hatchback, convertible, pickup, truck, van, minivan, cargovan, hybrid
      t.string :doors   #2-door, 3-door,4-door,5-door
      t.string :size    #small, large
      t.string :license_plate_number, length: 8
      t.string :state_registered,     length: 2
      t.string :color
      t.text   :comments

      t.timestamps
    end
  end
end
