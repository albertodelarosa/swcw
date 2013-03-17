class CreateSiteLocations < ActiveRecord::Migration
  def change
    create_table :site_locations do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :location_no

      t.timestamps
    end
  end
end
