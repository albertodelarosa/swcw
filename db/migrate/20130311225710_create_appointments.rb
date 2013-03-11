class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.string :appointment_no

      t.timestamps
    end

  add_index :appointments, :date

  create_table :appointments_customers, :id => false do |t|
    t.integer :user_id
    t.integer :appointment_id
  end

  add_index :appointments_customers, :user_id
  add_index :appointments_customers, :appointment_id
  add_index :appointments_customers, [:user_id, :appointment_id], :unique => true

  end
end
