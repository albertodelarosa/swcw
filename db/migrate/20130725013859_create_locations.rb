class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.belongs_to :account,      index: true
      t.belongs_to :user,         index: true
      t.belongs_to :appointment,  index: true
      t.belongs_to :vehicle,      index: true
      t.belongs_to :site,         index: true
      t.belongs_to :company,      index: true

      t.timestamps
    end
    add_index :locations, [:account_id, :user_id]
    add_index :locations, [:account_id, :appointment_id]
    add_index :locations, [:account_id, :vehicle_id]
    add_index :locations, [:account_id, :site_id]
    add_index :locations, [:account_id, :company_id]

    add_index :locations, [:user_id, :appointment_id]
    add_index :locations, [:user_id, :vehicle_id]
    add_index :locations, [:user_id, :site_id]
    add_index :locations, [:user_id, :company_id]

    add_index :locations, [:appointment_id, :vehicle_id]
    add_index :locations, [:appointment_id, :site_id]
    add_index :locations, [:appointment_id, :company_id]

    add_index :locations, [:vehicle_id, :site_id]
    add_index :locations, [:vehicle_id, :company_id]

    add_index :locations, [:site_id, :company_id]
  end
end
