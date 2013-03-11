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

ActiveRecord::Schema.define(:version => 20130311230521) do

  create_table "addresses", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "work1"
    t.string   "work2"
    t.string   "fax"
    t.string   "mobile"
    t.string   "title"
    t.string   "salutation"
    t.string   "child_class"
    t.string   "addressable_type"
    t.integer  "addressable_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "addresses", ["addressable_id"], :name => "index_addresses_on_addressable_id"

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

  create_table "customer_managers_customers", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "customer_id"
  end

  add_index "customer_managers_customers", ["customer_id"], :name => "index_customer_managers_customers_on_customer_id"
  add_index "customer_managers_customers", ["user_id", "customer_id"], :name => "index_customer_managers_customers_on_user_id_and_customer_id", :unique => true
  add_index "customer_managers_customers", ["user_id"], :name => "index_customer_managers_customers_on_user_id"

  create_table "customers", :force => true do |t|
    t.string   "customer_no"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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
    t.string   "username",               :default => "", :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
