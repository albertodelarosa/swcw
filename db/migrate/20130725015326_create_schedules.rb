class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.belongs_to :appointment
      t.belongs_to :company
      t.belongs_to :site
      t.belongs_to :vehicle
      t.belongs_to :user

      t.timestamps
    end
    add_index :schedules, :appointment_id
    add_index :schedules, :company_id
    add_index :schedules, :site_id
    add_index :schedules, :vehicle_id
    add_index :schedules, :user_id

    add_index :schedules, [:appointment_id,  :company_id]
    add_index :schedules, [:appointment_id,  :site_id]
    add_index :schedules, [:appointment_id,  :vehicle_id]
    add_index :schedules, [:appointment_id,  :user_id]

    add_index :schedules, [:company_id,  :site_id]
    add_index :schedules, [:company_id,  :vehicle_id]
    add_index :schedules, [:company_id,  :user_id]

    add_index :schedules, [:site_id,  :vehicle_id]
    add_index :schedules, [:site_id,  :user_id]

    add_index :schedules, [:vehicle_id,  :user_id]
  end
end
