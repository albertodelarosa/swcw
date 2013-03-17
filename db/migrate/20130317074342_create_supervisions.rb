class CreateSupervisions < ActiveRecord::Migration
  def change
    create_table :supervisions do |t|
      t.integer :site_location_id
      t.integer :van_manager_id

      t.timestamps
    end

    add_index :supervisions, :site_location_id
    add_index :supervisions, :van_manager_id
    add_index :supervisions, [:site_location_id, :van_manager_id], :unique => true

  end
end
