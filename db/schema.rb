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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150315010819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "addresses", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  add_index "admin_users", ["username"], name: "index_admin_users_on_username", unique: true, using: :btree

  create_table "appointments", force: :cascade do |t|
    t.string   "number"
    t.date     "date",                    default: '2015-01-01',          null: false
    t.time     "drop_off_time",           default: '2000-01-01 00:00:00', null: false
    t.time     "pick_up_time",            default: '2000-01-01 00:00:00', null: false
    t.text     "notes",                   default: "",                    null: false
    t.string   "user_username",           default: "",                    null: false
    t.string   "user_email",              default: "",                    null: false
    t.string   "user_first_name",         default: "",                    null: false
    t.string   "user_last_name",          default: "",                    null: false
    t.string   "user_salutation",         default: "",                    null: false
    t.string   "user_suffix",             default: "",                    null: false
    t.string   "company_corporate_id",    default: "",                    null: false
    t.string   "company_name",            default: "",                    null: false
    t.string   "company_email",           default: "",                    null: false
    t.string   "company_description",     default: "",                    null: false
    t.decimal  "company_siteler_dollars", default: 0.0,                   null: false
    t.boolean  "company_remove_cc_info",  default: false,                 null: false
    t.boolean  "company_user_reg",        default: false,                 null: false
    t.boolean  "company_paypal",          default: false,                 null: false
    t.boolean  "company_coupons",         default: false,                 null: false
    t.boolean  "company_google_checkout", default: false,                 null: false
    t.string   "site_name",               default: "",                    null: false
    t.text     "site_comments",           default: "",                    null: false
    t.float    "site_latitude",           default: 0.0,                   null: false
    t.float    "site_longitude",          default: 0.0,                   null: false
    t.string   "vehicle_license_number",  default: "",                    null: false
    t.string   "vehicle_state",           default: "",                    null: false
    t.string   "vehicle_color",           default: "",                    null: false
    t.string   "vehicle_comments",        default: "",                    null: false
    t.string   "vehicle_year",            default: "",                    null: false
    t.string   "vehicle_make",            default: "",                    null: false
    t.string   "vehicle_model",           default: "",                    null: false
    t.string   "vehicle_trim",            default: "",                    null: false
    t.string   "vehicle_type",            default: "",                    null: false
    t.string   "vehicle_doors",           default: "",                    null: false
    t.string   "vehicle_size",            default: "",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clienteles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "vehicle_id"
    t.integer  "company_id"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clienteles", ["company_id", "site_id"], name: "index_clienteles_on_company_id_and_site_id", using: :btree
  add_index "clienteles", ["company_id", "user_id"], name: "index_clienteles_on_company_id_and_user_id", using: :btree
  add_index "clienteles", ["company_id", "vehicle_id"], name: "index_clienteles_on_company_id_and_vehicle_id", using: :btree
  add_index "clienteles", ["company_id"], name: "index_clienteles_on_company_id", using: :btree
  add_index "clienteles", ["site_id", "user_id"], name: "index_clienteles_on_site_id_and_user_id", using: :btree
  add_index "clienteles", ["site_id", "vehicle_id"], name: "index_clienteles_on_site_id_and_vehicle_id", using: :btree
  add_index "clienteles", ["site_id"], name: "index_clienteles_on_site_id", using: :btree
  add_index "clienteles", ["user_id", "vehicle_id"], name: "index_clienteles_on_user_id_and_vehicle_id", using: :btree
  add_index "clienteles", ["user_id"], name: "index_clienteles_on_user_id", using: :btree
  add_index "clienteles", ["vehicle_id"], name: "index_clienteles_on_vehicle_id", using: :btree

  create_table "companies", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_infos", force: :cascade do |t|
    t.string   "email"
    t.string   "mobile"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "fax"
    t.string   "ext"
    t.string   "child_class"
    t.string   "contactable_type"
    t.integer  "contactable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discounts", force: :cascade do |t|
    t.string   "name"
    t.decimal  "percentage"
    t.boolean  "applied"
    t.string   "transaction_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "discounts", ["applied"], name: "index_discounts_on_applied", using: :btree
  add_index "discounts", ["name"], name: "index_discounts_on_name", using: :btree
  add_index "discounts", ["percentage"], name: "index_discounts_on_percentage", using: :btree
  add_index "discounts", ["transaction_id"], name: "index_discounts_on_transaction_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.integer  "vehicle_id"
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "site_id"
    t.integer  "appointment_id"
    t.integer  "washing_service_id"
    t.integer  "coupon_id"
    t.integer  "siteler_dollar_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["appointment_id", "company_id"], name: "index_locations_on_appointment_id_and_company_id", using: :btree
  add_index "locations", ["appointment_id", "coupon_id"], name: "index_locations_on_appointment_id_and_coupon_id", using: :btree
  add_index "locations", ["appointment_id", "site_id"], name: "index_locations_on_appointment_id_and_site_id", using: :btree
  add_index "locations", ["appointment_id", "siteler_dollar_id"], name: "index_locations_on_appointment_id_and_siteler_dollar_id", using: :btree
  add_index "locations", ["appointment_id", "user_id"], name: "index_locations_on_appointment_id_and_user_id", using: :btree
  add_index "locations", ["appointment_id", "vehicle_id"], name: "index_locations_on_appointment_id_and_vehicle_id", using: :btree
  add_index "locations", ["appointment_id"], name: "index_locations_on_appointment_id", using: :btree
  add_index "locations", ["company_id", "coupon_id"], name: "index_locations_on_company_id_and_coupon_id", using: :btree
  add_index "locations", ["company_id", "site_id"], name: "index_locations_on_company_id_and_site_id", using: :btree
  add_index "locations", ["company_id", "siteler_dollar_id"], name: "index_locations_on_company_id_and_siteler_dollar_id", using: :btree
  add_index "locations", ["company_id", "user_id"], name: "index_locations_on_company_id_and_user_id", using: :btree
  add_index "locations", ["company_id", "vehicle_id"], name: "index_locations_on_company_id_and_vehicle_id", using: :btree
  add_index "locations", ["company_id"], name: "index_locations_on_company_id", using: :btree
  add_index "locations", ["coupon_id", "siteler_dollar_id"], name: "index_locations_on_coupon_id_and_siteler_dollar_id", using: :btree
  add_index "locations", ["coupon_id", "user_id"], name: "index_locations_on_coupon_id_and_user_id", using: :btree
  add_index "locations", ["coupon_id"], name: "index_locations_on_coupon_id", using: :btree
  add_index "locations", ["site_id", "coupon_id"], name: "index_locations_on_site_id_and_coupon_id", using: :btree
  add_index "locations", ["site_id", "siteler_dollar_id"], name: "index_locations_on_site_id_and_siteler_dollar_id", using: :btree
  add_index "locations", ["site_id", "user_id"], name: "index_locations_on_site_id_and_user_id", using: :btree
  add_index "locations", ["site_id", "vehicle_id"], name: "index_locations_on_site_id_and_vehicle_id", using: :btree
  add_index "locations", ["site_id"], name: "index_locations_on_site_id", using: :btree
  add_index "locations", ["siteler_dollar_id", "user_id"], name: "index_locations_on_siteler_dollar_id_and_user_id", using: :btree
  add_index "locations", ["siteler_dollar_id"], name: "index_locations_on_siteler_dollar_id", using: :btree
  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree
  add_index "locations", ["vehicle_id", "coupon_id"], name: "index_locations_on_vehicle_id_and_coupon_id", using: :btree
  add_index "locations", ["vehicle_id", "siteler_dollar_id"], name: "index_locations_on_vehicle_id_and_siteler_dollar_id", using: :btree
  add_index "locations", ["vehicle_id", "user_id"], name: "index_locations_on_vehicle_id_and_user_id", using: :btree
  add_index "locations", ["vehicle_id"], name: "index_locations_on_vehicle_id", using: :btree

  create_table "sites", force: :cascade do |t|
    t.string   "name"
    t.text     "comments"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sitler_dollars", force: :cascade do |t|
    t.string   "name"
    t.decimal  "amount_paid"
    t.decimal  "bonus_siteler_dollars"
    t.decimal  "percentage"
    t.decimal  "total_siteler_dollars"
    t.decimal  "siteler_dollars_remaining"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "sitler_dollars", ["amount_paid"], name: "index_sitler_dollars_on_amount_paid", using: :btree
  add_index "sitler_dollars", ["bonus_siteler_dollars"], name: "index_sitler_dollars_on_bonus_siteler_dollars", using: :btree
  add_index "sitler_dollars", ["name"], name: "index_sitler_dollars_on_name", using: :btree
  add_index "sitler_dollars", ["percentage"], name: "index_sitler_dollars_on_percentage", using: :btree
  add_index "sitler_dollars", ["siteler_dollars_remaining"], name: "index_sitler_dollars_on_siteler_dollars_remaining", using: :btree
  add_index "sitler_dollars", ["total_siteler_dollars"], name: "index_sitler_dollars_on_total_siteler_dollars", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "salutation",             default: "", null: false
    t.string   "suffix",                 default: "", null: false
    t.string   "provider",               default: "", null: false
    t.string   "uid",                    default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicle_doors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_makes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_models", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_settings", force: :cascade do |t|
    t.integer  "vehicle_id"
    t.integer  "vehicle_year_id"
    t.integer  "vehicle_make_id"
    t.integer  "vehicle_model_id"
    t.integer  "vehicle_trim_id"
    t.integer  "vehicle_type_id"
    t.integer  "vehicle_door_id"
    t.integer  "vehicle_size_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicle_settings", ["vehicle_door_id", "vehicle_type_id"], name: "index_vehicle_settings_on_vehicle_door_id_and_vehicle_type_id", using: :btree
  add_index "vehicle_settings", ["vehicle_door_id"], name: "index_vehicle_settings_on_vehicle_door_id", using: :btree
  add_index "vehicle_settings", ["vehicle_id", "vehicle_door_id"], name: "index_vehicle_settings_on_vehicle_id_and_vehicle_door_id", using: :btree
  add_index "vehicle_settings", ["vehicle_id", "vehicle_make_id"], name: "index_vehicle_settings_on_vehicle_id_and_vehicle_make_id", using: :btree
  add_index "vehicle_settings", ["vehicle_id", "vehicle_model_id"], name: "index_vehicle_settings_on_vehicle_id_and_vehicle_model_id", using: :btree
  add_index "vehicle_settings", ["vehicle_id", "vehicle_size_id"], name: "index_vehicle_settings_on_vehicle_id_and_vehicle_size_id", using: :btree
  add_index "vehicle_settings", ["vehicle_id", "vehicle_trim_id"], name: "index_vehicle_settings_on_vehicle_id_and_vehicle_trim_id", using: :btree
  add_index "vehicle_settings", ["vehicle_id", "vehicle_type_id"], name: "index_vehicle_settings_on_vehicle_id_and_vehicle_type_id", using: :btree
  add_index "vehicle_settings", ["vehicle_id", "vehicle_year_id"], name: "index_vehicle_settings_on_vehicle_id_and_vehicle_year_id", using: :btree
  add_index "vehicle_settings", ["vehicle_id"], name: "index_vehicle_settings_on_vehicle_id", using: :btree
  add_index "vehicle_settings", ["vehicle_make_id", "vehicle_model_id"], name: "index_vehicle_settings_on_vehicle_make_id_and_vehicle_model_id", using: :btree
  add_index "vehicle_settings", ["vehicle_make_id"], name: "index_vehicle_settings_on_vehicle_make_id", using: :btree
  add_index "vehicle_settings", ["vehicle_model_id", "vehicle_trim_id"], name: "index_vehicle_settings_on_vehicle_model_id_and_vehicle_trim_id", using: :btree
  add_index "vehicle_settings", ["vehicle_model_id"], name: "index_vehicle_settings_on_vehicle_model_id", using: :btree
  add_index "vehicle_settings", ["vehicle_size_id", "vehicle_type_id"], name: "index_vehicle_settings_on_vehicle_size_id_and_vehicle_type_id", using: :btree
  add_index "vehicle_settings", ["vehicle_size_id"], name: "index_vehicle_settings_on_vehicle_size_id", using: :btree
  add_index "vehicle_settings", ["vehicle_trim_id", "vehicle_type_id"], name: "index_vehicle_settings_on_vehicle_trim_id_and_vehicle_type_id", using: :btree
  add_index "vehicle_settings", ["vehicle_trim_id", "vehicle_year_id"], name: "index_vehicle_settings_on_vehicle_trim_id_and_vehicle_year_id", using: :btree
  add_index "vehicle_settings", ["vehicle_trim_id"], name: "index_vehicle_settings_on_vehicle_trim_id", using: :btree
  add_index "vehicle_settings", ["vehicle_type_id"], name: "index_vehicle_settings_on_vehicle_type_id", using: :btree
  add_index "vehicle_settings", ["vehicle_year_id"], name: "index_vehicle_settings_on_vehicle_year_id", using: :btree

  create_table "vehicle_sizes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_trims", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicle_years", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "license_plate_number"
    t.string   "state_registered"
    t.string   "color"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "washing_services", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price_large",              precision: 5, scale: 2
    t.decimal  "price_small",              precision: 5, scale: 2
    t.integer  "duration"
    t.string   "child_class"
    t.string   "washing_serviceable_type"
    t.integer  "washing_serviceable_id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "washing_services", ["description"], name: "index_washing_services_on_description", using: :btree
  add_index "washing_services", ["duration"], name: "index_washing_services_on_duration", using: :btree
  add_index "washing_services", ["name"], name: "index_washing_services_on_name", using: :btree
  add_index "washing_services", ["price_large"], name: "index_washing_services_on_price_large", using: :btree
  add_index "washing_services", ["price_small"], name: "index_washing_services_on_price_small", using: :btree

end
