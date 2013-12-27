class CreateAppointments < ActiveRecord::Migration
  def change
    create_table  :appointments do |t|
      t.datetime  :appointment_date
      t.string    :appointment_number
      t.datetime  :drop_off_time
      t.datetime  :pick_up_time
      t.text      :notes

      t.integer   :user_id
      t.string    :username,   :null => false, :default => ""
      t.string    :first_name, :null => false, :default => ""
      t.string    :last_name,  :null => false, :default => ""
      t.string    :salutation, :null => false, :default => ""
      t.string    :suffix,     :null => false, :default => ""

      t.integer   :company_id
      t.string    :company_name
      t.string    :corporate_id
      t.string    :company_description
      t.string    :corporate_email_domain

      t.integer   :site_id
      t.string    :site_name
      t.text      :site_comments
      t.float     :site_latitude
      t.float     :site_longitude

      t.integer  :vehicle_id
      t.string   :vehicle_year, length: 4
      t.string   :vehicle_make
      t.string   :vehicle_model
      t.string   :vehicle_trim
      t.string   :vehicle_type
      t.string   :vehicle_doors
      t.string   :vehicle_size
      t.string   :license_plate_number, length: 8
      t.string   :state_registered,     length: 2
      t.string   :vehicle_color


      t.timestamps
    end
  end
end
