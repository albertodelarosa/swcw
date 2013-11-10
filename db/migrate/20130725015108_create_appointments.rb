class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string   :appointment_number
      t.datetime :drop_off_time
      t.datetime :pick_up_time
      t.string   :vehicle
      t.string   :company
      t.string   :site
      t.text     :notes
      t.string   :year, length: 4
      t.string   :make
      t.string   :model
      t.string   :trim
      t.string   :type
      t.string   :doors
      t.string   :size
      t.string   :license_plate_number, length: 8
      t.string   :state_registered,     length: 2
      t.string   :color
      t.text     :comments
      t.integer  :vehicle_id
      t.integer  :company_id
      t.integer  :site_id


      t.timestamps
    end
  end
end
