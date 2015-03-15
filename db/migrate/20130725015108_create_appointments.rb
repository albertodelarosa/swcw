class CreateAppointments < ActiveRecord::Migration
  def change
    create_table  :appointments do |t|
      t.string    :number
      t.date      :date,          :null => false, :default => "2015-01-01"
      t.time      :drop_off_time, :null => false, :default => "00:00:00"
      t.time      :pick_up_time,  :null => false, :default => "00:00:00"
      t.text      :notes,         :null => false, :default => ""

      t.string    :user_username,    :null => false, :default => ""
      t.string    :user_email,       :null => false, :default => ""
      t.string    :user_first_name,  :null => false, :default => ""
      t.string    :user_last_name,   :null => false, :default => ""
      t.string    :user_salutation,  :null => false, :default => ""
      t.string    :user_suffix,      :null => false, :default => ""

      t.string    :company_corporate_id,    :null => false, :default => ""
      t.string    :company_name,            :null => false, :default => ""
      t.string    :company_email,           :null => false, :default => ""
      t.string    :company_description,     :null => false, :default => ""
      t.decimal   :company_siteler_dollars, :null => false, :default => 0.0
      t.boolean   :company_remove_cc_info,  :null => false, :default => false
      t.boolean   :company_user_reg,        :null => false, :default => false
      t.boolean   :company_paypal,          :null => false, :default => false
      t.boolean   :company_coupons,         :null => false, :default => false
      t.boolean   :company_google_checkout, :null => false, :default => false

      t.string    :site_name,       :null => false, :default => ""
      t.text      :site_comments,   :null => false, :default => ""
      t.float     :site_latitude,   :null => false, :default => 0.0
      t.float     :site_longitude,  :null => false, :default => 0.0

      t.string    :vehicle_license_number, length: 8,  :null => false, :default => ""
      t.string    :vehicle_state, length: 2,           :null => false, :default => ""
      t.string    :vehicle_color,                      :null => false, :default => ""
      t.string    :vehicle_comments,                   :null => false, :default => ""

      t.string    :vehicle_year, length: 4, :null => false, :default => ""
      t.string    :vehicle_make,            :null => false, :default => ""
      t.string    :vehicle_model,           :null => false, :default => ""
      t.string    :vehicle_trim,            :null => false, :default => ""
      t.string    :vehicle_type,            :null => false, :default => ""
      t.string    :vehicle_doors,           :null => false, :default => ""
      t.string    :vehicle_size,            :null => false, :default => ""

      t.timestamps
    end
  end
end
