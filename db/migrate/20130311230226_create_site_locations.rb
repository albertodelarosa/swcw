class CreateSiteLocations < ActiveRecord::Migration
  def change
    create_table :site_locations do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :location_no

      t.timestamps
    end
    create_table :site_managers_van_managers, :id => false do |t|
      t.integer :site_manager_id
      t.integer :van_manager_id
    end

    add_index :site_managers_van_managers, :site_manager_id
    add_index :site_managers_van_managers, :van_manager_id
    add_index :site_managers_van_managers, [:site_manager_id, :van_manager_id], :unique => true
  end
end
