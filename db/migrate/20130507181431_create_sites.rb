class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name,     null: false, default: "",   index: true
      t.text :comments,   null: false, default: "",   index: true
      t.float :latitude,  null: false, default: 0.0,  index: true
      t.float :longitude, null: false, default: 0.0,  index: true

      t.timestamps
    end
    add_index :sites, [:latitude, :longitude]

    add_index :sites, [:name, :latitude]
    add_index :sites, [:name, :longitude]
  end
end
