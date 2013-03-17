class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.integer :site_location_id
      t.integer :site_manager_id

      t.timestamps
    end

    add_index :staffs, :site_location_id
    add_index :staffs, :site_manager_id
    add_index :staffs, [:site_location_id, :site_manager_id], :unique => true

  end
end
