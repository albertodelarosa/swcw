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

ActiveRecord::Schema.define(:version => 20130316172825) do

  create_table "addresses", :force => true do |t|
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "work1"
    t.string   "work2"
    t.string   "fax"
    t.string   "mobile"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "appointments", :force => true do |t|
    t.datetime "date"
    t.string   "appointment_no"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "appointments", ["date"], :name => "index_appointments_on_date"

  create_table "appointments_customers", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "appointment_id"
  end

  add_index "appointments_customers", ["appointment_id"], :name => "index_appointments_customers_on_appointment_id"
  add_index "appointments_customers", ["user_id", "appointment_id"], :name => "index_appointments_customers_on_user_id_and_appointment_id", :unique => true
  add_index "appointments_customers", ["user_id"], :name => "index_appointments_customers_on_user_id"

  create_table "companies", :force => true do |t|
    t.string   "company_no"
    t.string   "business_id"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "companies_customers", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "customer_id"
  end

  add_index "companies_customers", ["company_id", "customer_id"], :name => "cos_custs", :unique => true
  add_index "companies_customers", ["company_id"], :name => "index_companies_customers_on_company_id"
  add_index "companies_customers", ["customer_id"], :name => "index_companies_customers_on_customer_id"

  create_table "companies_site_locations", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "site_location_id"
  end

  add_index "companies_site_locations", ["company_id", "site_location_id"], :name => "cos_site_locs", :unique => true
  add_index "companies_site_locations", ["company_id"], :name => "index_companies_site_locations_on_company_id"
  add_index "companies_site_locations", ["site_location_id"], :name => "index_companies_site_locations_on_site_location_id"

  create_table "companies_site_managers", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "site_manager_id"
  end

  add_index "companies_site_managers", ["company_id", "site_manager_id"], :name => "cos_site_mgrs", :unique => true
  add_index "companies_site_managers", ["company_id"], :name => "index_companies_site_managers_on_company_id"
  add_index "companies_site_managers", ["site_manager_id"], :name => "index_companies_site_managers_on_site_manager_id"

  create_table "companies_van_managers", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "van_managers_id"
  end

  add_index "companies_van_managers", ["company_id", "van_managers_id"], :name => "cos_van_mgrs", :unique => true
  add_index "companies_van_managers", ["company_id"], :name => "index_companies_van_managers_on_company_id"
  add_index "companies_van_managers", ["van_managers_id"], :name => "index_companies_van_managers_on_van_managers_id"

  create_table "customers", :force => true do |t|
    t.string   "customer_no"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "salutation"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "role_users", :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.integer  "appointment_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "role_users", ["appointment_id"], :name => "index_role_users_on_appointment_id"
  add_index "role_users", ["role_id"], :name => "index_role_users_on_role_id"
  add_index "role_users", ["user_id"], :name => "index_role_users_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "site_locations", :force => true do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "location_no"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "site_managers_van_managers", :id => false, :force => true do |t|
    t.integer "site_manager_id"
    t.integer "van_manager_id"
  end

  add_index "site_managers_van_managers", ["site_manager_id", "van_manager_id"], :name => "site_mgrs_van_mgrs", :unique => true
  add_index "site_managers_van_managers", ["site_manager_id"], :name => "index_site_managers_van_managers_on_site_manager_id"
  add_index "site_managers_van_managers", ["van_manager_id"], :name => "index_site_managers_van_managers_on_van_manager_id"

  create_table "users", :force => true do |t|
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

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
