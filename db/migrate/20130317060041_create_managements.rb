class CreateManagements < ActiveRecord::Migration
  def change
    create_table :managements do |t|
      t.integer :site_manager_id
      t.integer :van_manager_id

      t.timestamps
    end

    add_index :managements, :site_manager_id
    add_index :managements, :van_manager_id
    add_index :managements, [:site_manager_id, :van_manager_id], :unique => true

  end
end
