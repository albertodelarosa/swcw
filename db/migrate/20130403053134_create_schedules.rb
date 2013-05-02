class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :appointment_id
      t.integer :company_id
      t.integer :customer_id
      t.integer :site_id
      t.integer :site_manager_id
      t.integer :van_manager_id
      t.integer :user_id

      t.timestamps
    end

    add_index :schedules, :appointment_id
    add_index :schedules, :company_id
    add_index :schedules, :customer_id
    add_index :schedules, :site_id
    add_index :schedules, :site_manager_id
    add_index :schedules, :van_manager_id
    add_index :schedules, :user_id

    add_index :schedules, [:appointment_id, :user_id],          :unique => true
    add_index :schedules, [:company_id,     :site_id],          :unique => true
    add_index :schedules, [:customer_id,    :site_id],          :unique => true
    add_index :schedules, [:company_id,     :customer_id],      :unique => true
    add_index :schedules, [:site_id,        :van_manager_id],   :unique => true
    add_index :schedules, [:company_id,     :site_manager_id],  :unique => true
    add_index :schedules, [:customer_id,    :site_manager_id],  :unique => true
    add_index :schedules, [:appointment_id, :site_manager_id],  :unique => true

  end
end
