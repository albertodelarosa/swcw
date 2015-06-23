class CreateAppointments < ActiveRecord::Migration
  def change
    create_table  :appointments do |t|
      t.string    :number,        index: true
      t.date      :date,          index: true, null: false, default: "2015-01-01"
      t.time      :drop_off_time, index: true, null: false, default: "00:00:00"
      t.time      :pick_up_time,  index: true, null: false, default: "00:00:00"
      t.text      :notes,         index: true, null: false, default: ""

      t.string    :user_username,    index: true, null: false, default: ""
      t.string    :user_email,       index: true, null: false, default: ""
      t.string    :user_first_name,  index: true, null: false, default: ""
      t.string    :user_last_name,   index: true, null: false, default: ""
      t.string    :user_salutation,  index: true, null: false, default: ""
      t.string    :user_suffix,      index: true, null: false, default: ""

      t.string    :company_corporate_id,    index: true, null: false, default: ""
      t.string    :company_name,            index: true, null: false, default: ""
      t.string    :company_email,           index: true, null: false, default: ""
      t.string    :company_description,     index: true, null: false, default: ""
      t.decimal   :company_siteler_dollars, index: true, null: false, default: 0.0
      t.boolean   :company_remove_cc_info,  index: true, null: false, default: false
      t.boolean   :company_user_reg,        index: true, null: false, default: false
      t.boolean   :company_paypal,          index: true, null: false, default: false
      t.boolean   :company_coupons,         index: true, null: false, default: false
      t.boolean   :company_google_checkout, index: true, null: false, default: false

      t.string    :site_name,       index: true, null: false, default: ""
      t.text      :site_comments,   index: true, null: false, default: ""
      t.float     :site_latitude,   index: true, null: false, default: 0.0
      t.float     :site_longitude,  index: true, null: false, default: 0.0

      t.string    :vehicle_license_number, length: 8,  index: true, null: false, default: ""
      t.string    :vehicle_state, length: 2,           index: true, null: false, default: ""
      t.string    :vehicle_color,                      index: true, null: false, default: ""
      t.string    :vehicle_comments,                   index: true, null: false, default: ""

      t.string    :vehicle_year, length: 4, index: true, null: false, default: ""
      t.string    :vehicle_make,            index: true, null: false, default: ""
      t.string    :vehicle_model,           index: true, null: false, default: ""
      t.string    :vehicle_trim,            index: true, null: false, default: ""
      t.string    :vehicle_type,            index: true, null: false, default: ""
      t.string    :vehicle_doors,           index: true, null: false, default: ""
      t.string    :vehicle_size,            index: true, null: false, default: ""

      t.timestamps
    end
    add_index :appointments, [:number, :date]
    add_index :appointments, [:number, :drop_off_time]
    add_index :appointments, [:number, :pick_up_time]
    add_index :appointments, [:number, :notes]

    add_index :appointments, [:date, :drop_off_time]
    add_index :appointments, [:date, :pick_up_time]
    add_index :appointments, [:date, :notes]

    add_index :appointments, [:drop_off_time, :pick_up_time]
    add_index :appointments, [:drop_off_time, :notes]

    add_index :appointments, [:pick_up_time, :notes]
  end
end
