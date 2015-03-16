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
    t.string   "street1",          default: "", null: false
    t.string   "suite_no",         default: "", null: false
    t.string   "apt_no",           default: "", null: false
    t.string   "street2",          default: "", null: false
    t.string   "city",             default: "", null: false
    t.string   "state",            default: "", null: false
    t.string   "zip",              default: "", null: false
    t.string   "child_class"
    t.string   "addressable_type"
    t.integer  "addressable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["apt_no"], name: "index_addresses_on_apt_no", using: :btree
  add_index "addresses", ["city"], name: "index_addresses_on_city", using: :btree
  add_index "addresses", ["state"], name: "index_addresses_on_state", using: :btree
  add_index "addresses", ["street1"], name: "index_addresses_on_street1", using: :btree
  add_index "addresses", ["street2"], name: "index_addresses_on_street2", using: :btree
  add_index "addresses", ["suite_no"], name: "index_addresses_on_suite_no", using: :btree
  add_index "addresses", ["zip"], name: "index_addresses_on_zip", using: :btree

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

  create_table "companies", force: :cascade do |t|
    t.string   "corporate_id",                                       default: "",    null: false
    t.string   "name",                                               default: "",    null: false
    t.string   "description",                                        default: "",    null: false
    t.string   "corporate_email_domain",                             default: "",    null: false
    t.decimal  "siteler_dollars_percentage", precision: 4, scale: 2, default: 0.0,   null: false
    t.boolean  "remove_cc_info",                                     default: false, null: false
    t.boolean  "user_reg_allowed",                                   default: false, null: false
    t.boolean  "paypal_allowed",                                     default: false, null: false
    t.boolean  "coupons_allowd",                                     default: false, null: false
    t.boolean  "google_checkout_allowed",                            default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["corporate_email_domain"], name: "index_companies_on_corporate_email_domain", using: :btree
  add_index "companies", ["corporate_id"], name: "index_companies_on_corporate_id", using: :btree
  add_index "companies", ["coupons_allowd"], name: "index_companies_on_coupons_allowd", using: :btree
  add_index "companies", ["description"], name: "index_companies_on_description", using: :btree
  add_index "companies", ["google_checkout_allowed"], name: "index_companies_on_google_checkout_allowed", using: :btree
  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree
  add_index "companies", ["paypal_allowed"], name: "index_companies_on_paypal_allowed", using: :btree
  add_index "companies", ["remove_cc_info"], name: "index_companies_on_remove_cc_info", using: :btree
  add_index "companies", ["siteler_dollars_percentage"], name: "index_companies_on_siteler_dollars_percentage", using: :btree
  add_index "companies", ["user_reg_allowed"], name: "index_companies_on_user_reg_allowed", using: :btree

  create_table "contact_infos", force: :cascade do |t|
    t.string   "email",            default: "", null: false
    t.string   "mobile",           default: "", null: false
    t.string   "phone1",           default: "", null: false
    t.string   "phone2",           default: "", null: false
    t.string   "fax",              default: "", null: false
    t.string   "ext",              default: "", null: false
    t.string   "child_class"
    t.string   "contactable_type"
    t.integer  "contactable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contact_infos", ["email"], name: "index_contact_infos_on_email", using: :btree
  add_index "contact_infos", ["ext"], name: "index_contact_infos_on_ext", using: :btree
  add_index "contact_infos", ["fax"], name: "index_contact_infos_on_fax", using: :btree
  add_index "contact_infos", ["mobile"], name: "index_contact_infos_on_mobile", using: :btree
  add_index "contact_infos", ["phone1"], name: "index_contact_infos_on_phone1", using: :btree
  add_index "contact_infos", ["phone2"], name: "index_contact_infos_on_phone2", using: :btree

  create_table "discounts", force: :cascade do |t|
    t.string   "name",                                   default: "",           null: false
    t.decimal  "percentage",     precision: 4, scale: 2, default: 0.0,          null: false
    t.boolean  "applied",                                default: false,        null: false
    t.string   "transaction_id",                         default: "",           null: false
    t.date     "expires",                                default: '2015-01-01', null: false
    t.boolean  "expireable",                             default: false,        null: false
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  add_index "discounts", ["applied"], name: "index_discounts_on_applied", using: :btree
  add_index "discounts", ["expireable"], name: "index_discounts_on_expireable", using: :btree
  add_index "discounts", ["expires"], name: "index_discounts_on_expires", using: :btree
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
  add_index "locations", ["appointment_id", "washing_service_id"], name: "index_locations_on_appointment_id_and_washing_service_id", using: :btree
  add_index "locations", ["appointment_id"], name: "index_locations_on_appointment_id", using: :btree
  add_index "locations", ["company_id", "coupon_id"], name: "index_locations_on_company_id_and_coupon_id", using: :btree
  add_index "locations", ["company_id", "site_id"], name: "index_locations_on_company_id_and_site_id", using: :btree
  add_index "locations", ["company_id", "siteler_dollar_id"], name: "index_locations_on_company_id_and_siteler_dollar_id", using: :btree
  add_index "locations", ["company_id", "user_id"], name: "index_locations_on_company_id_and_user_id", using: :btree
  add_index "locations", ["company_id", "vehicle_id"], name: "index_locations_on_company_id_and_vehicle_id", using: :btree
  add_index "locations", ["company_id", "washing_service_id"], name: "index_locations_on_company_id_and_washing_service_id", using: :btree
  add_index "locations", ["company_id"], name: "index_locations_on_company_id", using: :btree
  add_index "locations", ["coupon_id", "siteler_dollar_id"], name: "index_locations_on_coupon_id_and_siteler_dollar_id", using: :btree
  add_index "locations", ["coupon_id", "user_id"], name: "index_locations_on_coupon_id_and_user_id", using: :btree
  add_index "locations", ["coupon_id"], name: "index_locations_on_coupon_id", using: :btree
  add_index "locations", ["site_id", "coupon_id"], name: "index_locations_on_site_id_and_coupon_id", using: :btree
  add_index "locations", ["site_id", "siteler_dollar_id"], name: "index_locations_on_site_id_and_siteler_dollar_id", using: :btree
  add_index "locations", ["site_id", "user_id"], name: "index_locations_on_site_id_and_user_id", using: :btree
  add_index "locations", ["site_id", "vehicle_id"], name: "index_locations_on_site_id_and_vehicle_id", using: :btree
  add_index "locations", ["site_id", "washing_service_id"], name: "index_locations_on_site_id_and_washing_service_id", using: :btree
  add_index "locations", ["site_id"], name: "index_locations_on_site_id", using: :btree
  add_index "locations", ["siteler_dollar_id", "user_id"], name: "index_locations_on_siteler_dollar_id_and_user_id", using: :btree
  add_index "locations", ["siteler_dollar_id"], name: "index_locations_on_siteler_dollar_id", using: :btree
  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree
  add_index "locations", ["vehicle_id", "coupon_id"], name: "index_locations_on_vehicle_id_and_coupon_id", using: :btree
  add_index "locations", ["vehicle_id", "siteler_dollar_id"], name: "index_locations_on_vehicle_id_and_siteler_dollar_id", using: :btree
  add_index "locations", ["vehicle_id", "user_id"], name: "index_locations_on_vehicle_id_and_user_id", using: :btree
  add_index "locations", ["vehicle_id", "washing_service_id"], name: "index_locations_on_vehicle_id_and_washing_service_id", using: :btree
  add_index "locations", ["vehicle_id"], name: "index_locations_on_vehicle_id", using: :btree
  add_index "locations", ["washing_service_id", "coupon_id"], name: "index_locations_on_washing_service_id_and_coupon_id", using: :btree
  add_index "locations", ["washing_service_id", "siteler_dollar_id"], name: "index_locations_on_washing_service_id_and_siteler_dollar_id", using: :btree
  add_index "locations", ["washing_service_id", "user_id"], name: "index_locations_on_washing_service_id_and_user_id", using: :btree
  add_index "locations", ["washing_service_id"], name: "index_locations_on_washing_service_id", using: :btree

  create_table "siteler_dollars", force: :cascade do |t|
    t.string   "name",                                              default: "",  null: false
    t.decimal  "amount_paid",               precision: 8, scale: 2, default: 0.0, null: false
    t.decimal  "bonus_siteler_dollars",     precision: 8, scale: 2, default: 0.0, null: false
    t.decimal  "percentage",                precision: 4, scale: 2, default: 0.0, null: false
    t.decimal  "total_siteler_dollars",     precision: 8, scale: 2, default: 0.0, null: false
    t.decimal  "siteler_dollars_remaining", precision: 8, scale: 2, default: 0.0, null: false
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
  end

  add_index "siteler_dollars", ["amount_paid"], name: "index_siteler_dollars_on_amount_paid", using: :btree
  add_index "siteler_dollars", ["bonus_siteler_dollars"], name: "index_siteler_dollars_on_bonus_siteler_dollars", using: :btree
  add_index "siteler_dollars", ["name"], name: "index_siteler_dollars_on_name", using: :btree
  add_index "siteler_dollars", ["percentage"], name: "index_siteler_dollars_on_percentage", using: :btree
  add_index "siteler_dollars", ["siteler_dollars_remaining"], name: "index_siteler_dollars_on_siteler_dollars_remaining", using: :btree
  add_index "siteler_dollars", ["total_siteler_dollars"], name: "index_siteler_dollars_on_total_siteler_dollars", using: :btree

  create_table "sites", force: :cascade do |t|
    t.string   "name",       default: "",  null: false
    t.text     "comments",   default: "",  null: false
    t.float    "latitude",   default: 0.0, null: false
    t.float    "longitude",  default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sites", ["comments"], name: "index_sites_on_comments", using: :btree
  add_index "sites", ["latitude"], name: "index_sites_on_latitude", using: :btree
  add_index "sites", ["longitude"], name: "index_sites_on_longitude", using: :btree
  add_index "sites", ["name"], name: "index_sites_on_name", using: :btree

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

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "vehicle_doors", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicle_doors", ["name"], name: "index_vehicle_doors_on_name", using: :btree

  create_table "vehicle_settings", force: :cascade do |t|
    t.integer  "vehicle_id"
    t.integer  "vehicle_type_id"
    t.integer  "vehicle_door_id"
    t.integer  "vehicle_size_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicle_settings", ["vehicle_door_id", "vehicle_size_id"], name: "index_vehicle_settings_on_vehicle_door_id_and_vehicle_size_id", using: :btree
  add_index "vehicle_settings", ["vehicle_door_id"], name: "index_vehicle_settings_on_vehicle_door_id", using: :btree
  add_index "vehicle_settings", ["vehicle_id", "vehicle_door_id"], name: "index_vehicle_settings_on_vehicle_id_and_vehicle_door_id", using: :btree
  add_index "vehicle_settings", ["vehicle_id", "vehicle_size_id"], name: "index_vehicle_settings_on_vehicle_id_and_vehicle_size_id", using: :btree
  add_index "vehicle_settings", ["vehicle_id", "vehicle_type_id"], name: "index_vehicle_settings_on_vehicle_id_and_vehicle_type_id", using: :btree
  add_index "vehicle_settings", ["vehicle_id"], name: "index_vehicle_settings_on_vehicle_id", using: :btree
  add_index "vehicle_settings", ["vehicle_size_id"], name: "index_vehicle_settings_on_vehicle_size_id", using: :btree
  add_index "vehicle_settings", ["vehicle_type_id", "vehicle_door_id"], name: "index_vehicle_settings_on_vehicle_type_id_and_vehicle_door_id", using: :btree
  add_index "vehicle_settings", ["vehicle_type_id", "vehicle_size_id"], name: "index_vehicle_settings_on_vehicle_type_id_and_vehicle_size_id", using: :btree
  add_index "vehicle_settings", ["vehicle_type_id"], name: "index_vehicle_settings_on_vehicle_type_id", using: :btree

  create_table "vehicle_sizes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicle_sizes", ["name"], name: "index_vehicle_sizes_on_name", using: :btree

  create_table "vehicle_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicle_types", ["name"], name: "index_vehicle_types_on_name", using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.string   "year",             default: "", null: false
    t.string   "make",             default: "", null: false
    t.string   "model",            default: "", null: false
    t.string   "trim",             default: "", null: false
    t.string   "license_plate",    default: "", null: false
    t.string   "state_registered", default: "", null: false
    t.string   "color",            default: "", null: false
    t.text     "comments",         default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicles", ["color"], name: "index_vehicles_on_color", using: :btree
  add_index "vehicles", ["comments"], name: "index_vehicles_on_comments", using: :btree
  add_index "vehicles", ["license_plate"], name: "index_vehicles_on_license_plate", using: :btree
  add_index "vehicles", ["make"], name: "index_vehicles_on_make", using: :btree
  add_index "vehicles", ["model"], name: "index_vehicles_on_model", using: :btree
  add_index "vehicles", ["state_registered"], name: "index_vehicles_on_state_registered", using: :btree
  add_index "vehicles", ["trim"], name: "index_vehicles_on_trim", using: :btree
  add_index "vehicles", ["year"], name: "index_vehicles_on_year", using: :btree

  create_table "washing_services", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price_large",              precision: 8, scale: 2
    t.decimal  "price_small",              precision: 8, scale: 2
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
