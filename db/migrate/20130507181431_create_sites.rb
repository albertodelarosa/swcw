class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name,     null: false, default: ""
      t.text :comments,   null: false, default: ""
      t.float :latitude,  null: false, default: 0.0
      t.float :longitude, null: false, default: 0.0

      t.timestamps
    end
    add_index :sites, :name
    add_index :sites, :comments
    add_index :sites, :latitude
    add_index :sites, :longitude
  end
end
