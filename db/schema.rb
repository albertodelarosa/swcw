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

ActiveRecord::Schema.define(:version => 20130507213429) do

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

  create_table "clienteles", :force => true do |t|
    t.integer  "site_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "clienteles", ["site_id"], :name => "index_clienteles_on_site_id"
  add_index "clienteles", ["user_id"], :name => "index_clienteles_on_user_id"

  create_table "companies", :force => true do |t|
    t.string   "company_id"
    t.string   "name"
    t.string   "description"
    t.string   "corporate_email_domain"
    t.decimal  "siteler_dollars_percentage"
    t.boolean  "remove_cc_info"
    t.boolean  "user_reg_allowed"
    t.boolean  "paypal_allowed"
    t.boolean  "coupons_allowd"
    t.boolean  "google_checkout_allowed"
    t.integer  "user_id"
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
    t.string   "name"
    t.text     "comments"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "makes", :force => true do |t|
    t.string   "name"
    t.integer  "vehicle_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "makes", ["vehicle_id"], :name => "index_makes_on_vehicle_id"

  create_table "models", :force => true do |t|
    t.string   "name"
    t.string   "size"
    t.integer  "make_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "models", ["make_id"], :name => "index_models_on_make_id"

  create_table "models_trims", :id => false, :force => true do |t|
    t.integer "model_id"
    t.integer "trim_id"
  end

  add_index "models_trims", ["model_id"], :name => "index_models_trims_on_model_id"
  add_index "models_trims", ["trim_id"], :name => "index_models_trims_on_trim_id"

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

  create_table "trims", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",               :default => "", :null => false
    t.string   "first_name",             :default => "", :null => false
    t.string   "last_name",              :default => "", :null => false
    t.string   "salutation",             :default => "", :null => false
    t.string   "suffix",                 :default => "", :null => false
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

  create_table "vehicles", :force => true do |t|
    t.string   "year"
    t.string   "color"
    t.string   "doors"
    t.string   "license_plate_number"
    t.string   "comments"
    t.string   "size"
    t.string   "state_registered"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

end
