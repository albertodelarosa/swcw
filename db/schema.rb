# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130725015326) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "addresses", :force => true do |t|
    t.string   "street1"
    t.string   "suite_no"
    t.string   "apt_no"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "child_class"
    t.string   "addressable_type"
    t.integer  "addressable_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "admin_users", :force => true do |t|
    t.string   "username",               :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true
  add_index "admin_users", ["username"], :name => "index_admin_users_on_username", :unique => true

  create_table "appointments", :force => true do |t|
    t.string   "number"
    t.datetime "date",                    :default => '2015-01-13 19:00:30', :null => false
    t.datetime "drop_off_time",           :default => '2015-01-13 19:00:30', :null => false
    t.datetime "pick_up_time",            :default => '2015-01-13 19:00:30', :null => false
    t.text     "notes",                   :default => "",                    :null => false
    t.string   "user_username",           :default => "",                    :null => false
    t.string   "user_email",              :default => "",                    :null => false
    t.string   "user_first_name",         :default => "",                    :null => false
    t.string   "user_last_name",          :default => "",                    :null => false
    t.string   "user_salutation",         :default => "",                    :null => false
    t.string   "user_suffix",             :default => "",                    :null => false
    t.string   "company_corporate_id",    :default => "",                    :null => false
    t.string   "company_name",            :default => "",                    :null => false
    t.string   "company_email",           :default => "",                    :null => false
    t.string   "company_description",     :default => "",                    :null => false
    t.decimal  "company_siteler_dollars", :default => 0.0,                   :null => false
    t.boolean  "company_remove_cc_info",  :default => false,                 :null => false
    t.boolean  "company_user_reg",        :default => false,                 :null => false
    t.boolean  "company_paypal",          :default => false,                 :null => false
    t.boolean  "company_coupons",         :default => false,                 :null => false
    t.boolean  "company_google_checkout", :default => false,                 :null => false
    t.string   "site_name",               :default => "",                    :null => false
    t.text     "site_comments",           :default => "",                    :null => false
    t.float    "site_latitude",           :default => 0.0,                   :null => false
    t.float    "site_longitude",          :default => 0.0,                   :null => false
    t.string   "vehicle_year",            :default => "",                    :null => false
    t.string   "vehicle_make",            :default => "",                    :null => false
    t.string   "vehicle_model",           :default => "",                    :null => false
    t.string   "vehicle_trim",            :default => "",                    :null => false
    t.string   "vehicle_type",            :default => "",                    :null => false
    t.string   "vehicle_doors",           :default => "",                    :null => false
    t.string   "vehicle_size",            :default => "",                    :null => false
    t.string   "vehicle_license_number",  :default => "",                    :null => false
    t.string   "vehicle_state",           :default => "",                    :null => false
    t.string   "vehicle_color",           :default => "",                    :null => false
    t.string   "vehicle_comments",        :default => "",                    :null => false
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
  end

  create_table "clienteles", :force => true do |t|
    t.integer  "site_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "clienteles", ["site_id"], :name => "index_clienteles_on_site_id"
  add_index "clienteles", ["user_id"], :name => "index_clienteles_on_user_id"

  create_table "companies", :force => true do |t|
    t.string   "corporate_id"
    t.string   "name"
    t.string   "description"
    t.string   "corporate_email_domain"
    t.decimal  "siteler_dollars_percentage"
    t.boolean  "remove_cc_info"
    t.boolean  "user_reg_allowed"
    t.boolean  "paypal_allowed"
    t.boolean  "coupons_allowd"
    t.boolean  "google_checkout_allowed"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "contact_infos", :force => true do |t|
    t.string   "email"
    t.string   "mobile"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "fax"
    t.string   "ext"
    t.string   "child_class"
    t.string   "contactable_type"
    t.integer  "contactable_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "locations", :force => true do |t|
    t.integer  "vehicle_id"
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "site_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "locations", ["company_id", "site_id"], :name => "index_locations_on_company_id_and_site_id"
  add_index "locations", ["company_id", "user_id"], :name => "index_locations_on_company_id_and_user_id"
  add_index "locations", ["company_id", "vehicle_id"], :name => "index_locations_on_company_id_and_vehicle_id"
  add_index "locations", ["company_id"], :name => "index_locations_on_company_id"
  add_index "locations", ["site_id", "user_id"], :name => "index_locations_on_site_id_and_user_id"
  add_index "locations", ["site_id", "vehicle_id"], :name => "index_locations_on_site_id_and_vehicle_id"
  add_index "locations", ["site_id"], :name => "index_locations_on_site_id"
  add_index "locations", ["user_id", "vehicle_id"], :name => "index_locations_on_user_id_and_vehicle_id"
  add_index "locations", ["user_id"], :name => "index_locations_on_user_id"
  add_index "locations", ["vehicle_id"], :name => "index_locations_on_vehicle_id"

  create_table "schedules", :force => true do |t|
    t.integer  "appointment_id"
    t.integer  "company_id"
    t.integer  "site_id"
    t.integer  "vehicle_id"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "schedules", ["appointment_id", "company_id"], :name => "index_schedules_on_appointment_id_and_company_id"
  add_index "schedules", ["appointment_id", "site_id"], :name => "index_schedules_on_appointment_id_and_site_id"
  add_index "schedules", ["appointment_id", "user_id"], :name => "index_schedules_on_appointment_id_and_user_id"
  add_index "schedules", ["appointment_id", "vehicle_id"], :name => "index_schedules_on_appointment_id_and_vehicle_id"
  add_index "schedules", ["appointment_id"], :name => "index_schedules_on_appointment_id"
  add_index "schedules", ["company_id", "site_id"], :name => "index_schedules_on_company_id_and_site_id"
  add_index "schedules", ["company_id", "user_id"], :name => "index_schedules_on_company_id_and_user_id"
  add_index "schedules", ["company_id", "vehicle_id"], :name => "index_schedules_on_company_id_and_vehicle_id"
  add_index "schedules", ["company_id"], :name => "index_schedules_on_company_id"
  add_index "schedules", ["site_id", "user_id"], :name => "index_schedules_on_site_id_and_user_id"
  add_index "schedules", ["site_id", "vehicle_id"], :name => "index_schedules_on_site_id_and_vehicle_id"
  add_index "schedules", ["site_id"], :name => "index_schedules_on_site_id"
  add_index "schedules", ["user_id"], :name => "index_schedules_on_user_id"
  add_index "schedules", ["vehicle_id", "user_id"], :name => "index_schedules_on_vehicle_id_and_user_id"
  add_index "schedules", ["vehicle_id"], :name => "index_schedules_on_vehicle_id"

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.text     "comments"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transportations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "vehicle_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "transportations", ["user_id", "vehicle_id"], :name => "index_transportations_on_user_id_and_vehicle_id", :unique => true
  add_index "transportations", ["user_id"], :name => "index_transportations_on_user_id"
  add_index "transportations", ["vehicle_id"], :name => "index_transportations_on_vehicle_id"

  create_table "users", :force => true do |t|
    t.string   "username",               :default => "", :null => false
    t.string   "first_name",             :default => "", :null => false
    t.string   "last_name",              :default => "", :null => false
    t.string   "salutation",             :default => "", :null => false
    t.string   "suffix",                 :default => "", :null => false
    t.string   "provider",               :default => "", :null => false
    t.string   "uid",                    :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vehicle_doors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vehicle_makes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vehicle_models", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vehicle_settings", :force => true do |t|
    t.integer  "vehicle_id"
    t.integer  "vehicle_year_id"
    t.integer  "vehicle_make_id"
    t.integer  "vehicle_model_id"
    t.integer  "vehicle_trim_id"
    t.integer  "vehicle_type_id"
    t.integer  "vehicle_door_id"
    t.integer  "vehicle_size_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "vehicle_settings", ["vehicle_door_id", "vehicle_type_id"], :name => "index_vehicle_settings_on_vehicle_door_id_and_vehicle_type_id"
  add_index "vehicle_settings", ["vehicle_door_id"], :name => "index_vehicle_settings_on_vehicle_door_id"
  add_index "vehicle_settings", ["vehicle_id", "vehicle_door_id"], :name => "index_vehicle_settings_on_vehicle_id_and_vehicle_door_id"
  add_index "vehicle_settings", ["vehicle_id", "vehicle_make_id"], :name => "index_vehicle_settings_on_vehicle_id_and_vehicle_make_id"
  add_index "vehicle_settings", ["vehicle_id", "vehicle_model_id"], :name => "index_vehicle_settings_on_vehicle_id_and_vehicle_model_id"
  add_index "vehicle_settings", ["vehicle_id", "vehicle_size_id"], :name => "index_vehicle_settings_on_vehicle_id_and_vehicle_size_id"
  add_index "vehicle_settings", ["vehicle_id", "vehicle_trim_id"], :name => "index_vehicle_settings_on_vehicle_id_and_vehicle_trim_id"
  add_index "vehicle_settings", ["vehicle_id", "vehicle_type_id"], :name => "index_vehicle_settings_on_vehicle_id_and_vehicle_type_id"
  add_index "vehicle_settings", ["vehicle_id", "vehicle_year_id"], :name => "index_vehicle_settings_on_vehicle_id_and_vehicle_year_id"
  add_index "vehicle_settings", ["vehicle_id"], :name => "index_vehicle_settings_on_vehicle_id"
  add_index "vehicle_settings", ["vehicle_make_id", "vehicle_model_id"], :name => "index_vehicle_settings_on_vehicle_make_id_and_vehicle_model_id"
  add_index "vehicle_settings", ["vehicle_make_id"], :name => "index_vehicle_settings_on_vehicle_make_id"
  add_index "vehicle_settings", ["vehicle_model_id", "vehicle_trim_id"], :name => "index_vehicle_settings_on_vehicle_model_id_and_vehicle_trim_id"
  add_index "vehicle_settings", ["vehicle_model_id"], :name => "index_vehicle_settings_on_vehicle_model_id"
  add_index "vehicle_settings", ["vehicle_size_id", "vehicle_type_id"], :name => "index_vehicle_settings_on_vehicle_size_id_and_vehicle_type_id"
  add_index "vehicle_settings", ["vehicle_size_id"], :name => "index_vehicle_settings_on_vehicle_size_id"
  add_index "vehicle_settings", ["vehicle_trim_id", "vehicle_type_id"], :name => "index_vehicle_settings_on_vehicle_trim_id_and_vehicle_type_id"
  add_index "vehicle_settings", ["vehicle_trim_id", "vehicle_year_id"], :name => "index_vehicle_settings_on_vehicle_trim_id_and_vehicle_year_id"
  add_index "vehicle_settings", ["vehicle_trim_id"], :name => "index_vehicle_settings_on_vehicle_trim_id"
  add_index "vehicle_settings", ["vehicle_type_id"], :name => "index_vehicle_settings_on_vehicle_type_id"
  add_index "vehicle_settings", ["vehicle_year_id"], :name => "index_vehicle_settings_on_vehicle_year_id"

  create_table "vehicle_sizes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vehicle_trims", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vehicle_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vehicle_years", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vehicles", :force => true do |t|
    t.string   "license_plate_number"
    t.string   "state_registered"
    t.string   "color"
    t.text     "comments"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

end
