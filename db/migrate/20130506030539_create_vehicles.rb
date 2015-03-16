class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :year,                 length: 8,  null: false, default: ""
      t.string :make,                             null: false, default: ""
      t.string :model,                            null: false, default: ""
      t.string :trim,                             null: false, default: ""
      t.string :license_plate,        length: 8,  null: false, default: ""
      t.string :state_registered,     length: 2,  null: false, default: ""
      t.string :color,                            null: false, default: ""
      t.text   :comments,                         null: false, default: ""

      t.timestamps
    end
    add_index :vehicles, :license_plate
    add_index :vehicles, :state_registered
    add_index :vehicles, :color
    add_index :vehicles, :comments
    add_index :vehicles, :year
    add_index :vehicles, :make
    add_index :vehicles, :model
    add_index :vehicles, :trim
  end
end
