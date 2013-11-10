class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.belongs_to :vehicle
      t.belongs_to :user
      t.belongs_to :company
      t.belongs_to :site

      t.timestamps
    end

    add_index :locations, :vehicle_id
    add_index :locations, :user_id
    add_index :locations, :company_id
    add_index :locations, :site_id

    add_index :locations, [:company_id,  :site_id]
    add_index :locations, [:company_id,  :user_id]
    add_index :locations, [:company_id,  :vehicle_id]

    add_index :locations, [:site_id,  :user_id]
    add_index :locations, [:site_id,  :vehicle_id]

    add_index :locations, [:user_id,  :vehicle_id]
  end
end
