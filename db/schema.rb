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

ActiveRecord::Schema.define(version: 20150608205134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "account_number",                            default: "",    null: false
    t.string   "status",                                    default: "new", null: false
    t.decimal  "sd_percent",        precision: 4, scale: 2, default: 0.0,   null: false
    t.boolean  "remove_cc_info",                            default: false, null: false
    t.boolean  "regular_allowed",                           default: false, null: false
    t.boolean  "paypal_allowed",                            default: false, null: false
    t.boolean  "google_allowed",                            default: false, null: false
    t.boolean  "apple_pay_allowed",                         default: false, null: false
    t.boolean  "coupons_allowed",                           default: false, null: false
    t.integer  "user_id"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  add_index "accounts", ["account_number", "apple_pay_allowed"], name: "index_accounts_on_account_number_and_apple_pay_allowed", using: :btree
  add_index "accounts", ["account_number", "coupons_allowed"], name: "index_accounts_on_account_number_and_coupons_allowed", using: :btree
  add_index "accounts", ["account_number", "google_allowed"], name: "index_accounts_on_account_number_and_google_allowed", using: :btree
  add_index "accounts", ["account_number", "paypal_allowed"], name: "index_accounts_on_account_number_and_paypal_allowed", using: :btree
  add_index "accounts", ["account_number", "regular_allowed"], name: "index_accounts_on_account_number_and_regular_allowed", using: :btree
  add_index "accounts", ["account_number", "remove_cc_info"], name: "index_accounts_on_account_number_and_remove_cc_info", using: :btree
  add_index "accounts", ["account_number", "sd_percent"], name: "index_accounts_on_account_number_and_sd_percent", using: :btree
  add_index "accounts", ["account_number", "status"], name: "index_accounts_on_account_number_and_status", using: :btree
  add_index "accounts", ["account_number"], name: "index_accounts_on_account_number", using: :btree
  add_index "accounts", ["apple_pay_allowed", "coupons_allowed"], name: "index_accounts_on_apple_pay_allowed_and_coupons_allowed", using: :btree
  add_index "accounts", ["apple_pay_allowed"], name: "index_accounts_on_apple_pay_allowed", using: :btree
  add_index "accounts", ["coupons_allowed"], name: "index_accounts_on_coupons_allowed", using: :btree
  add_index "accounts", ["google_allowed", "apple_pay_allowed"], name: "index_accounts_on_google_allowed_and_apple_pay_allowed", using: :btree
  add_index "accounts", ["google_allowed", "coupons_allowed"], name: "index_accounts_on_google_allowed_and_coupons_allowed", using: :btree
  add_index "accounts", ["google_allowed"], name: "index_accounts_on_google_allowed", using: :btree
  add_index "accounts", ["paypal_allowed", "apple_pay_allowed"], name: "index_accounts_on_paypal_allowed_and_apple_pay_allowed", using: :btree
  add_index "accounts", ["paypal_allowed", "coupons_allowed"], name: "index_accounts_on_paypal_allowed_and_coupons_allowed", using: :btree
  add_index "accounts", ["paypal_allowed", "google_allowed"], name: "index_accounts_on_paypal_allowed_and_google_allowed", using: :btree
  add_index "accounts", ["paypal_allowed"], name: "index_accounts_on_paypal_allowed", using: :btree
  add_index "accounts", ["regular_allowed", "apple_pay_allowed"], name: "index_accounts_on_regular_allowed_and_apple_pay_allowed", using: :btree
  add_index "accounts", ["regular_allowed", "coupons_allowed"], name: "index_accounts_on_regular_allowed_and_coupons_allowed", using: :btree
  add_index "accounts", ["regular_allowed", "google_allowed"], name: "index_accounts_on_regular_allowed_and_google_allowed", using: :btree
  add_index "accounts", ["regular_allowed", "paypal_allowed"], name: "index_accounts_on_regular_allowed_and_paypal_allowed", using: :btree
  add_index "accounts", ["regular_allowed"], name: "index_accounts_on_regular_allowed", using: :btree
  add_index "accounts", ["remove_cc_info", "apple_pay_allowed"], name: "index_accounts_on_remove_cc_info_and_apple_pay_allowed", using: :btree
  add_index "accounts", ["remove_cc_info", "coupons_allowed"], name: "index_accounts_on_remove_cc_info_and_coupons_allowed", using: :btree
  add_index "accounts", ["remove_cc_info", "google_allowed"], name: "index_accounts_on_remove_cc_info_and_google_allowed", using: :btree
  add_index "accounts", ["remove_cc_info", "paypal_allowed"], name: "index_accounts_on_remove_cc_info_and_paypal_allowed", using: :btree
  add_index "accounts", ["remove_cc_info", "regular_allowed"], name: "index_accounts_on_remove_cc_info_and_regular_allowed", using: :btree
  add_index "accounts", ["remove_cc_info"], name: "index_accounts_on_remove_cc_info", using: :btree
  add_index "accounts", ["sd_percent", "apple_pay_allowed"], name: "index_accounts_on_sd_percent_and_apple_pay_allowed", using: :btree
  add_index "accounts", ["sd_percent", "coupons_allowed"], name: "index_accounts_on_sd_percent_and_coupons_allowed", using: :btree
  add_index "accounts", ["sd_percent", "google_allowed"], name: "index_accounts_on_sd_percent_and_google_allowed", using: :btree
  add_index "accounts", ["sd_percent", "paypal_allowed"], name: "index_accounts_on_sd_percent_and_paypal_allowed", using: :btree
  add_index "accounts", ["sd_percent", "regular_allowed"], name: "index_accounts_on_sd_percent_and_regular_allowed", using: :btree
  add_index "accounts", ["sd_percent", "remove_cc_info"], name: "index_accounts_on_sd_percent_and_remove_cc_info", using: :btree
  add_index "accounts", ["sd_percent"], name: "index_accounts_on_sd_percent", using: :btree
  add_index "accounts", ["status", "apple_pay_allowed"], name: "index_accounts_on_status_and_apple_pay_allowed", using: :btree
  add_index "accounts", ["status", "coupons_allowed"], name: "index_accounts_on_status_and_coupons_allowed", using: :btree
  add_index "accounts", ["status", "google_allowed"], name: "index_accounts_on_status_and_google_allowed", using: :btree
  add_index "accounts", ["status", "paypal_allowed"], name: "index_accounts_on_status_and_paypal_allowed", using: :btree
  add_index "accounts", ["status", "regular_allowed"], name: "index_accounts_on_status_and_regular_allowed", using: :btree
  add_index "accounts", ["status", "remove_cc_info"], name: "index_accounts_on_status_and_remove_cc_info", using: :btree
  add_index "accounts", ["status", "sd_percent"], name: "index_accounts_on_status_and_sd_percent", using: :btree
  add_index "accounts", ["status"], name: "index_accounts_on_status", using: :btree
  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

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

  add_index "addresses", ["apt_no", "city"], name: "index_addresses_on_apt_no_and_city", using: :btree
  add_index "addresses", ["apt_no", "state"], name: "index_addresses_on_apt_no_and_state", using: :btree
  add_index "addresses", ["apt_no", "street2"], name: "index_addresses_on_apt_no_and_street2", using: :btree
  add_index "addresses", ["apt_no", "zip"], name: "index_addresses_on_apt_no_and_zip", using: :btree
  add_index "addresses", ["apt_no"], name: "index_addresses_on_apt_no", using: :btree
  add_index "addresses", ["city", "state"], name: "index_addresses_on_city_and_state", using: :btree
  add_index "addresses", ["city", "zip"], name: "index_addresses_on_city_and_zip", using: :btree
  add_index "addresses", ["city"], name: "index_addresses_on_city", using: :btree
  add_index "addresses", ["state", "zip"], name: "index_addresses_on_state_and_zip", using: :btree
  add_index "addresses", ["state"], name: "index_addresses_on_state", using: :btree
  add_index "addresses", ["street1", "apt_no"], name: "index_addresses_on_street1_and_apt_no", using: :btree
  add_index "addresses", ["street1", "city"], name: "index_addresses_on_street1_and_city", using: :btree
  add_index "addresses", ["street1", "state"], name: "index_addresses_on_street1_and_state", using: :btree
  add_index "addresses", ["street1", "street2"], name: "index_addresses_on_street1_and_street2", using: :btree
  add_index "addresses", ["street1", "suite_no"], name: "index_addresses_on_street1_and_suite_no", using: :btree
  add_index "addresses", ["street1", "zip"], name: "index_addresses_on_street1_and_zip", using: :btree
  add_index "addresses", ["street1"], name: "index_addresses_on_street1", using: :btree
  add_index "addresses", ["street2", "city"], name: "index_addresses_on_street2_and_city", using: :btree
  add_index "addresses", ["street2", "state"], name: "index_addresses_on_street2_and_state", using: :btree
  add_index "addresses", ["street2", "zip"], name: "index_addresses_on_street2_and_zip", using: :btree
  add_index "addresses", ["street2"], name: "index_addresses_on_street2", using: :btree
  add_index "addresses", ["suite_no", "apt_no"], name: "index_addresses_on_suite_no_and_apt_no", using: :btree
  add_index "addresses", ["suite_no", "city"], name: "index_addresses_on_suite_no_and_city", using: :btree
  add_index "addresses", ["suite_no", "state"], name: "index_addresses_on_suite_no_and_state", using: :btree
  add_index "addresses", ["suite_no", "street2"], name: "index_addresses_on_suite_no_and_street2", using: :btree
  add_index "addresses", ["suite_no", "zip"], name: "index_addresses_on_suite_no_and_zip", using: :btree
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

  add_index "appointments", ["company_corporate_id"], name: "index_appointments_on_company_corporate_id", using: :btree
  add_index "appointments", ["company_coupons"], name: "index_appointments_on_company_coupons", using: :btree
  add_index "appointments", ["company_description"], name: "index_appointments_on_company_description", using: :btree
  add_index "appointments", ["company_email"], name: "index_appointments_on_company_email", using: :btree
  add_index "appointments", ["company_google_checkout"], name: "index_appointments_on_company_google_checkout", using: :btree
  add_index "appointments", ["company_name"], name: "index_appointments_on_company_name", using: :btree
  add_index "appointments", ["company_paypal"], name: "index_appointments_on_company_paypal", using: :btree
  add_index "appointments", ["company_remove_cc_info"], name: "index_appointments_on_company_remove_cc_info", using: :btree
  add_index "appointments", ["company_siteler_dollars"], name: "index_appointments_on_company_siteler_dollars", using: :btree
  add_index "appointments", ["company_user_reg"], name: "index_appointments_on_company_user_reg", using: :btree
  add_index "appointments", ["date", "drop_off_time"], name: "index_appointments_on_date_and_drop_off_time", using: :btree
  add_index "appointments", ["date", "notes"], name: "index_appointments_on_date_and_notes", using: :btree
  add_index "appointments", ["date", "pick_up_time"], name: "index_appointments_on_date_and_pick_up_time", using: :btree
  add_index "appointments", ["date"], name: "index_appointments_on_date", using: :btree
  add_index "appointments", ["drop_off_time", "notes"], name: "index_appointments_on_drop_off_time_and_notes", using: :btree
  add_index "appointments", ["drop_off_time", "pick_up_time"], name: "index_appointments_on_drop_off_time_and_pick_up_time", using: :btree
  add_index "appointments", ["drop_off_time"], name: "index_appointments_on_drop_off_time", using: :btree
  add_index "appointments", ["notes"], name: "index_appointments_on_notes", using: :btree
  add_index "appointments", ["number", "date"], name: "index_appointments_on_number_and_date", using: :btree
  add_index "appointments", ["number", "drop_off_time"], name: "index_appointments_on_number_and_drop_off_time", using: :btree
  add_index "appointments", ["number", "notes"], name: "index_appointments_on_number_and_notes", using: :btree
  add_index "appointments", ["number", "pick_up_time"], name: "index_appointments_on_number_and_pick_up_time", using: :btree
  add_index "appointments", ["number"], name: "index_appointments_on_number", using: :btree
  add_index "appointments", ["pick_up_time", "notes"], name: "index_appointments_on_pick_up_time_and_notes", using: :btree
  add_index "appointments", ["pick_up_time"], name: "index_appointments_on_pick_up_time", using: :btree
  add_index "appointments", ["site_comments"], name: "index_appointments_on_site_comments", using: :btree
  add_index "appointments", ["site_latitude"], name: "index_appointments_on_site_latitude", using: :btree
  add_index "appointments", ["site_longitude"], name: "index_appointments_on_site_longitude", using: :btree
  add_index "appointments", ["site_name"], name: "index_appointments_on_site_name", using: :btree
  add_index "appointments", ["user_email"], name: "index_appointments_on_user_email", using: :btree
  add_index "appointments", ["user_first_name"], name: "index_appointments_on_user_first_name", using: :btree
  add_index "appointments", ["user_last_name"], name: "index_appointments_on_user_last_name", using: :btree
  add_index "appointments", ["user_salutation"], name: "index_appointments_on_user_salutation", using: :btree
  add_index "appointments", ["user_suffix"], name: "index_appointments_on_user_suffix", using: :btree
  add_index "appointments", ["user_username"], name: "index_appointments_on_user_username", using: :btree
  add_index "appointments", ["vehicle_color"], name: "index_appointments_on_vehicle_color", using: :btree
  add_index "appointments", ["vehicle_comments"], name: "index_appointments_on_vehicle_comments", using: :btree
  add_index "appointments", ["vehicle_doors"], name: "index_appointments_on_vehicle_doors", using: :btree
  add_index "appointments", ["vehicle_license_number"], name: "index_appointments_on_vehicle_license_number", using: :btree
  add_index "appointments", ["vehicle_make"], name: "index_appointments_on_vehicle_make", using: :btree
  add_index "appointments", ["vehicle_model"], name: "index_appointments_on_vehicle_model", using: :btree
  add_index "appointments", ["vehicle_size"], name: "index_appointments_on_vehicle_size", using: :btree
  add_index "appointments", ["vehicle_state"], name: "index_appointments_on_vehicle_state", using: :btree
  add_index "appointments", ["vehicle_trim"], name: "index_appointments_on_vehicle_trim", using: :btree
  add_index "appointments", ["vehicle_type"], name: "index_appointments_on_vehicle_type", using: :btree
  add_index "appointments", ["vehicle_year"], name: "index_appointments_on_vehicle_year", using: :btree

  create_table "carts", force: :cascade do |t|
    t.datetime "purchased_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "carts", ["purchased_at"], name: "index_carts_on_purchased_at", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "corp_id",     default: "", null: false
    t.string   "name",        default: "", null: false
    t.string   "description", default: "", null: false
    t.string   "corp_email",  default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["corp_email"], name: "index_companies_on_corp_email", using: :btree
  add_index "companies", ["corp_id", "corp_email"], name: "index_companies_on_corp_id_and_corp_email", using: :btree
  add_index "companies", ["corp_id", "description"], name: "index_companies_on_corp_id_and_description", using: :btree
  add_index "companies", ["corp_id", "name"], name: "index_companies_on_corp_id_and_name", using: :btree
  add_index "companies", ["corp_id"], name: "index_companies_on_corp_id", using: :btree
  add_index "companies", ["description", "corp_email"], name: "index_companies_on_description_and_corp_email", using: :btree
  add_index "companies", ["description"], name: "index_companies_on_description", using: :btree
  add_index "companies", ["name", "corp_email"], name: "index_companies_on_name_and_corp_email", using: :btree
  add_index "companies", ["name", "description"], name: "index_companies_on_name_and_description", using: :btree
  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree

  create_table "contact_infos", force: :cascade do |t|
    t.string   "email",            default: "", null: false
    t.string   "mobile",           default: "", null: false
    t.string   "phone1",           default: "", null: false
    t.string   "phone2",           default: "", null: false
    t.string   "ext",              default: "", null: false
    t.string   "fax",              default: "", null: false
    t.string   "child_class"
    t.string   "contactable_type"
    t.integer  "contactable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contact_infos", ["email", "ext"], name: "index_contact_infos_on_email_and_ext", using: :btree
  add_index "contact_infos", ["email", "fax"], name: "index_contact_infos_on_email_and_fax", using: :btree
  add_index "contact_infos", ["email", "mobile"], name: "index_contact_infos_on_email_and_mobile", using: :btree
  add_index "contact_infos", ["email", "phone1"], name: "index_contact_infos_on_email_and_phone1", using: :btree
  add_index "contact_infos", ["email", "phone2"], name: "index_contact_infos_on_email_and_phone2", using: :btree
  add_index "contact_infos", ["email"], name: "index_contact_infos_on_email", using: :btree
  add_index "contact_infos", ["ext", "fax"], name: "index_contact_infos_on_ext_and_fax", using: :btree
  add_index "contact_infos", ["ext"], name: "index_contact_infos_on_ext", using: :btree
  add_index "contact_infos", ["fax"], name: "index_contact_infos_on_fax", using: :btree
  add_index "contact_infos", ["mobile", "ext"], name: "index_contact_infos_on_mobile_and_ext", using: :btree
  add_index "contact_infos", ["mobile", "fax"], name: "index_contact_infos_on_mobile_and_fax", using: :btree
  add_index "contact_infos", ["mobile", "phone1"], name: "index_contact_infos_on_mobile_and_phone1", using: :btree
  add_index "contact_infos", ["mobile", "phone2"], name: "index_contact_infos_on_mobile_and_phone2", using: :btree
  add_index "contact_infos", ["mobile"], name: "index_contact_infos_on_mobile", using: :btree
  add_index "contact_infos", ["phone1", "ext"], name: "index_contact_infos_on_phone1_and_ext", using: :btree
  add_index "contact_infos", ["phone1", "fax"], name: "index_contact_infos_on_phone1_and_fax", using: :btree
  add_index "contact_infos", ["phone1", "phone2"], name: "index_contact_infos_on_phone1_and_phone2", using: :btree
  add_index "contact_infos", ["phone1"], name: "index_contact_infos_on_phone1", using: :btree
  add_index "contact_infos", ["phone2", "ext"], name: "index_contact_infos_on_phone2_and_ext", using: :btree
  add_index "contact_infos", ["phone2", "fax"], name: "index_contact_infos_on_phone2_and_fax", using: :btree
  add_index "contact_infos", ["phone2"], name: "index_contact_infos_on_phone2", using: :btree

  create_table "discounts", force: :cascade do |t|
    t.string   "name",                                   default: "",           null: false
    t.decimal  "percentage",     precision: 4, scale: 2, default: 0.0,          null: false
    t.boolean  "applied",                                default: false,        null: false
    t.string   "transaction_id",                         default: "",           null: false
    t.date     "expires",                                default: '2015-01-01', null: false
    t.boolean  "expireable",                             default: false,        null: false
    t.integer  "account_id"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  add_index "discounts", ["account_id"], name: "index_discounts_on_account_id", using: :btree
  add_index "discounts", ["applied", "expireable"], name: "index_discounts_on_applied_and_expireable", using: :btree
  add_index "discounts", ["applied", "expires"], name: "index_discounts_on_applied_and_expires", using: :btree
  add_index "discounts", ["applied", "transaction_id"], name: "index_discounts_on_applied_and_transaction_id", using: :btree
  add_index "discounts", ["applied"], name: "index_discounts_on_applied", using: :btree
  add_index "discounts", ["expireable"], name: "index_discounts_on_expireable", using: :btree
  add_index "discounts", ["expires", "expireable"], name: "index_discounts_on_expires_and_expireable", using: :btree
  add_index "discounts", ["expires"], name: "index_discounts_on_expires", using: :btree
  add_index "discounts", ["name", "applied"], name: "index_discounts_on_name_and_applied", using: :btree
  add_index "discounts", ["name", "expireable"], name: "index_discounts_on_name_and_expireable", using: :btree
  add_index "discounts", ["name", "expires"], name: "index_discounts_on_name_and_expires", using: :btree
  add_index "discounts", ["name", "percentage"], name: "index_discounts_on_name_and_percentage", using: :btree
  add_index "discounts", ["name", "transaction_id"], name: "index_discounts_on_name_and_transaction_id", using: :btree
  add_index "discounts", ["name"], name: "index_discounts_on_name", using: :btree
  add_index "discounts", ["percentage", "applied"], name: "index_discounts_on_percentage_and_applied", using: :btree
  add_index "discounts", ["percentage", "expireable"], name: "index_discounts_on_percentage_and_expireable", using: :btree
  add_index "discounts", ["percentage", "expires"], name: "index_discounts_on_percentage_and_expires", using: :btree
  add_index "discounts", ["percentage", "transaction_id"], name: "index_discounts_on_percentage_and_transaction_id", using: :btree
  add_index "discounts", ["percentage"], name: "index_discounts_on_percentage", using: :btree
  add_index "discounts", ["transaction_id", "expireable"], name: "index_discounts_on_transaction_id_and_expireable", using: :btree
  add_index "discounts", ["transaction_id", "expires"], name: "index_discounts_on_transaction_id_and_expires", using: :btree
  add_index "discounts", ["transaction_id"], name: "index_discounts_on_transaction_id", using: :btree

  create_table "line_items", force: :cascade do |t|
    t.decimal  "unit_price",      default: 0.0, null: false
    t.integer  "quantity",        default: 0,   null: false
    t.integer  "cart_id"
    t.integer  "service_plan_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["quantity"], name: "index_line_items_on_quantity", using: :btree
  add_index "line_items", ["service_plan_id"], name: "index_line_items_on_service_plan_id", using: :btree
  add_index "line_items", ["unit_price", "quantity"], name: "index_line_items_on_unit_price_and_quantity", using: :btree
  add_index "line_items", ["unit_price"], name: "index_line_items_on_unit_price", using: :btree

  create_table "locations", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "user_id"
    t.integer  "appointment_id"
    t.integer  "vehicle_id"
    t.integer  "site_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["account_id", "appointment_id"], name: "index_locations_on_account_id_and_appointment_id", using: :btree
  add_index "locations", ["account_id", "company_id"], name: "index_locations_on_account_id_and_company_id", using: :btree
  add_index "locations", ["account_id", "site_id"], name: "index_locations_on_account_id_and_site_id", using: :btree
  add_index "locations", ["account_id", "user_id"], name: "index_locations_on_account_id_and_user_id", using: :btree
  add_index "locations", ["account_id", "vehicle_id"], name: "index_locations_on_account_id_and_vehicle_id", using: :btree
  add_index "locations", ["account_id"], name: "index_locations_on_account_id", using: :btree
  add_index "locations", ["appointment_id", "company_id"], name: "index_locations_on_appointment_id_and_company_id", using: :btree
  add_index "locations", ["appointment_id", "site_id"], name: "index_locations_on_appointment_id_and_site_id", using: :btree
  add_index "locations", ["appointment_id", "vehicle_id"], name: "index_locations_on_appointment_id_and_vehicle_id", using: :btree
  add_index "locations", ["appointment_id"], name: "index_locations_on_appointment_id", using: :btree
  add_index "locations", ["company_id"], name: "index_locations_on_company_id", using: :btree
  add_index "locations", ["site_id", "company_id"], name: "index_locations_on_site_id_and_company_id", using: :btree
  add_index "locations", ["site_id"], name: "index_locations_on_site_id", using: :btree
  add_index "locations", ["user_id", "appointment_id"], name: "index_locations_on_user_id_and_appointment_id", using: :btree
  add_index "locations", ["user_id", "company_id"], name: "index_locations_on_user_id_and_company_id", using: :btree
  add_index "locations", ["user_id", "site_id"], name: "index_locations_on_user_id_and_site_id", using: :btree
  add_index "locations", ["user_id", "vehicle_id"], name: "index_locations_on_user_id_and_vehicle_id", using: :btree
  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree
  add_index "locations", ["vehicle_id", "company_id"], name: "index_locations_on_vehicle_id_and_company_id", using: :btree
  add_index "locations", ["vehicle_id", "site_id"], name: "index_locations_on_vehicle_id_and_site_id", using: :btree
  add_index "locations", ["vehicle_id"], name: "index_locations_on_vehicle_id", using: :btree

  create_table "order_transactions", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "order_transactions", ["action", "amount"], name: "index_order_transactions_on_action_and_amount", using: :btree
  add_index "order_transactions", ["action", "authorization"], name: "index_order_transactions_on_action_and_authorization", using: :btree
  add_index "order_transactions", ["action", "message"], name: "index_order_transactions_on_action_and_message", using: :btree
  add_index "order_transactions", ["action", "params"], name: "index_order_transactions_on_action_and_params", using: :btree
  add_index "order_transactions", ["action", "success"], name: "index_order_transactions_on_action_and_success", using: :btree
  add_index "order_transactions", ["action"], name: "index_order_transactions_on_action", using: :btree
  add_index "order_transactions", ["amount", "authorization"], name: "index_order_transactions_on_amount_and_authorization", using: :btree
  add_index "order_transactions", ["amount", "message"], name: "index_order_transactions_on_amount_and_message", using: :btree
  add_index "order_transactions", ["amount", "params"], name: "index_order_transactions_on_amount_and_params", using: :btree
  add_index "order_transactions", ["amount", "success"], name: "index_order_transactions_on_amount_and_success", using: :btree
  add_index "order_transactions", ["amount"], name: "index_order_transactions_on_amount", using: :btree
  add_index "order_transactions", ["authorization", "message"], name: "index_order_transactions_on_authorization_and_message", using: :btree
  add_index "order_transactions", ["authorization", "params"], name: "index_order_transactions_on_authorization_and_params", using: :btree
  add_index "order_transactions", ["authorization"], name: "index_order_transactions_on_authorization", using: :btree
  add_index "order_transactions", ["message", "params"], name: "index_order_transactions_on_message_and_params", using: :btree
  add_index "order_transactions", ["message"], name: "index_order_transactions_on_message", using: :btree
  add_index "order_transactions", ["order_id", "action"], name: "index_order_transactions_on_order_id_and_action", using: :btree
  add_index "order_transactions", ["order_id", "amount"], name: "index_order_transactions_on_order_id_and_amount", using: :btree
  add_index "order_transactions", ["order_id", "authorization"], name: "index_order_transactions_on_order_id_and_authorization", using: :btree
  add_index "order_transactions", ["order_id", "message"], name: "index_order_transactions_on_order_id_and_message", using: :btree
  add_index "order_transactions", ["order_id", "params"], name: "index_order_transactions_on_order_id_and_params", using: :btree
  add_index "order_transactions", ["order_id", "success"], name: "index_order_transactions_on_order_id_and_success", using: :btree
  add_index "order_transactions", ["order_id"], name: "index_order_transactions_on_order_id", using: :btree
  add_index "order_transactions", ["params"], name: "index_order_transactions_on_params", using: :btree
  add_index "order_transactions", ["success", "authorization"], name: "index_order_transactions_on_success_and_authorization", using: :btree
  add_index "order_transactions", ["success", "message"], name: "index_order_transactions_on_success_and_message", using: :btree
  add_index "order_transactions", ["success", "params"], name: "index_order_transactions_on_success_and_params", using: :btree
  add_index "order_transactions", ["success"], name: "index_order_transactions_on_success", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "cart_id",         default: 0,            null: false
    t.string   "ip_address",      default: "",           null: false
    t.string   "first_name",      default: "",           null: false
    t.string   "last_name",       default: "",           null: false
    t.string   "card_type",       default: "",           null: false
    t.date     "card_expires_on", default: '2015-01-01', null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "orders", ["card_expires_on"], name: "index_orders_on_card_expires_on", using: :btree
  add_index "orders", ["card_type", "card_expires_on"], name: "index_orders_on_card_type_and_card_expires_on", using: :btree
  add_index "orders", ["card_type"], name: "index_orders_on_card_type", using: :btree
  add_index "orders", ["cart_id", "card_expires_on"], name: "index_orders_on_cart_id_and_card_expires_on", using: :btree
  add_index "orders", ["cart_id", "card_type"], name: "index_orders_on_cart_id_and_card_type", using: :btree
  add_index "orders", ["cart_id", "first_name"], name: "index_orders_on_cart_id_and_first_name", using: :btree
  add_index "orders", ["cart_id", "ip_address"], name: "index_orders_on_cart_id_and_ip_address", using: :btree
  add_index "orders", ["cart_id", "last_name"], name: "index_orders_on_cart_id_and_last_name", using: :btree
  add_index "orders", ["cart_id"], name: "index_orders_on_cart_id", using: :btree
  add_index "orders", ["first_name", "card_expires_on"], name: "index_orders_on_first_name_and_card_expires_on", using: :btree
  add_index "orders", ["first_name", "card_type"], name: "index_orders_on_first_name_and_card_type", using: :btree
  add_index "orders", ["first_name", "last_name"], name: "index_orders_on_first_name_and_last_name", using: :btree
  add_index "orders", ["first_name"], name: "index_orders_on_first_name", using: :btree
  add_index "orders", ["ip_address", "card_expires_on"], name: "index_orders_on_ip_address_and_card_expires_on", using: :btree
  add_index "orders", ["ip_address", "card_type"], name: "index_orders_on_ip_address_and_card_type", using: :btree
  add_index "orders", ["ip_address", "first_name"], name: "index_orders_on_ip_address_and_first_name", using: :btree
  add_index "orders", ["ip_address", "last_name"], name: "index_orders_on_ip_address_and_last_name", using: :btree
  add_index "orders", ["ip_address"], name: "index_orders_on_ip_address", using: :btree
  add_index "orders", ["last_name", "card_expires_on"], name: "index_orders_on_last_name_and_card_expires_on", using: :btree
  add_index "orders", ["last_name", "card_type"], name: "index_orders_on_last_name_and_card_type", using: :btree
  add_index "orders", ["last_name"], name: "index_orders_on_last_name", using: :btree

  create_table "service_plans", force: :cascade do |t|
    t.string   "name",                                 default: "",  null: false
    t.string   "status",                               default: "",  null: false
    t.string   "package_type",                         default: "",  null: false
    t.decimal  "price",        precision: 8, scale: 2, default: 0.0, null: false
    t.string   "vehicle_size",                         default: "",  null: false
    t.integer  "account_id"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "service_plans", ["name", "package_type"], name: "index_service_plans_on_name_and_package_type", using: :btree
  add_index "service_plans", ["name", "price"], name: "index_service_plans_on_name_and_price", using: :btree
  add_index "service_plans", ["name", "status"], name: "index_service_plans_on_name_and_status", using: :btree
  add_index "service_plans", ["name"], name: "index_service_plans_on_name", using: :btree
  add_index "service_plans", ["package_type", "price"], name: "index_service_plans_on_package_type_and_price", using: :btree
  add_index "service_plans", ["package_type"], name: "index_service_plans_on_package_type", using: :btree
  add_index "service_plans", ["price"], name: "index_service_plans_on_price", using: :btree
  add_index "service_plans", ["status", "package_type"], name: "index_service_plans_on_status_and_package_type", using: :btree
  add_index "service_plans", ["status", "price"], name: "index_service_plans_on_status_and_price", using: :btree
  add_index "service_plans", ["status"], name: "index_service_plans_on_status", using: :btree
  add_index "service_plans", ["vehicle_size"], name: "index_service_plans_on_vehicle_size", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name",                                             default: "",  null: false
    t.text     "description"
    t.decimal  "price",                    precision: 8, scale: 2, default: 0.0, null: false
    t.decimal  "small_price",              precision: 8, scale: 2, default: 0.0, null: false
    t.decimal  "large_price",              precision: 8, scale: 2, default: 0.0, null: false
    t.integer  "duration",                                         default: 0,   null: false
    t.integer  "service_plan_id"
    t.string   "child_class"
    t.string   "washing_serviceable_type"
    t.integer  "washing_serviceable_id"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
  end

  add_index "services", ["description", "duration"], name: "index_services_on_description_and_duration", using: :btree
  add_index "services", ["description", "large_price"], name: "index_services_on_description_and_large_price", using: :btree
  add_index "services", ["description", "price"], name: "index_services_on_description_and_price", using: :btree
  add_index "services", ["description", "small_price"], name: "index_services_on_description_and_small_price", using: :btree
  add_index "services", ["description"], name: "index_services_on_description", using: :btree
  add_index "services", ["duration"], name: "index_services_on_duration", using: :btree
  add_index "services", ["large_price", "duration"], name: "index_services_on_large_price_and_duration", using: :btree
  add_index "services", ["large_price"], name: "index_services_on_large_price", using: :btree
  add_index "services", ["name", "description"], name: "index_services_on_name_and_description", using: :btree
  add_index "services", ["name", "duration"], name: "index_services_on_name_and_duration", using: :btree
  add_index "services", ["name", "large_price"], name: "index_services_on_name_and_large_price", using: :btree
  add_index "services", ["name", "price"], name: "index_services_on_name_and_price", using: :btree
  add_index "services", ["name", "small_price"], name: "index_services_on_name_and_small_price", using: :btree
  add_index "services", ["name"], name: "index_services_on_name", using: :btree
  add_index "services", ["price", "duration"], name: "index_services_on_price_and_duration", using: :btree
  add_index "services", ["price", "large_price"], name: "index_services_on_price_and_large_price", using: :btree
  add_index "services", ["price", "small_price"], name: "index_services_on_price_and_small_price", using: :btree
  add_index "services", ["price"], name: "index_services_on_price", using: :btree
  add_index "services", ["small_price", "duration"], name: "index_services_on_small_price_and_duration", using: :btree
  add_index "services", ["small_price", "large_price"], name: "index_services_on_small_price_and_large_price", using: :btree
  add_index "services", ["small_price"], name: "index_services_on_small_price", using: :btree

  create_table "siteler_dollars", force: :cascade do |t|
    t.string   "name",                                default: "",  null: false
    t.decimal  "amount_paid", precision: 8, scale: 2, default: 0.0, null: false
    t.decimal  "bonus",       precision: 8, scale: 2, default: 0.0, null: false
    t.decimal  "percentage",  precision: 4, scale: 2, default: 0.0, null: false
    t.decimal  "total",       precision: 8, scale: 2, default: 0.0, null: false
    t.decimal  "remaining",   precision: 8, scale: 2, default: 0.0, null: false
    t.integer  "account_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "siteler_dollars", ["account_id"], name: "index_siteler_dollars_on_account_id", using: :btree
  add_index "siteler_dollars", ["amount_paid", "bonus"], name: "index_siteler_dollars_on_amount_paid_and_bonus", using: :btree
  add_index "siteler_dollars", ["amount_paid", "percentage"], name: "index_siteler_dollars_on_amount_paid_and_percentage", using: :btree
  add_index "siteler_dollars", ["amount_paid", "remaining"], name: "index_siteler_dollars_on_amount_paid_and_remaining", using: :btree
  add_index "siteler_dollars", ["amount_paid", "total"], name: "index_siteler_dollars_on_amount_paid_and_total", using: :btree
  add_index "siteler_dollars", ["amount_paid"], name: "index_siteler_dollars_on_amount_paid", using: :btree
  add_index "siteler_dollars", ["bonus", "percentage"], name: "index_siteler_dollars_on_bonus_and_percentage", using: :btree
  add_index "siteler_dollars", ["bonus", "remaining"], name: "index_siteler_dollars_on_bonus_and_remaining", using: :btree
  add_index "siteler_dollars", ["bonus", "total"], name: "index_siteler_dollars_on_bonus_and_total", using: :btree
  add_index "siteler_dollars", ["bonus"], name: "index_siteler_dollars_on_bonus", using: :btree
  add_index "siteler_dollars", ["name", "amount_paid"], name: "index_siteler_dollars_on_name_and_amount_paid", using: :btree
  add_index "siteler_dollars", ["name", "bonus"], name: "index_siteler_dollars_on_name_and_bonus", using: :btree
  add_index "siteler_dollars", ["name", "percentage"], name: "index_siteler_dollars_on_name_and_percentage", using: :btree
  add_index "siteler_dollars", ["name", "remaining"], name: "index_siteler_dollars_on_name_and_remaining", using: :btree
  add_index "siteler_dollars", ["name", "total"], name: "index_siteler_dollars_on_name_and_total", using: :btree
  add_index "siteler_dollars", ["name"], name: "index_siteler_dollars_on_name", using: :btree
  add_index "siteler_dollars", ["percentage", "remaining"], name: "index_siteler_dollars_on_percentage_and_remaining", using: :btree
  add_index "siteler_dollars", ["percentage", "total"], name: "index_siteler_dollars_on_percentage_and_total", using: :btree
  add_index "siteler_dollars", ["percentage"], name: "index_siteler_dollars_on_percentage", using: :btree
  add_index "siteler_dollars", ["remaining"], name: "index_siteler_dollars_on_remaining", using: :btree
  add_index "siteler_dollars", ["total", "remaining"], name: "index_siteler_dollars_on_total_and_remaining", using: :btree
  add_index "siteler_dollars", ["total"], name: "index_siteler_dollars_on_total", using: :btree

  create_table "sites", force: :cascade do |t|
    t.string   "name",       default: "",  null: false
    t.text     "comments",   default: "",  null: false
    t.float    "latitude",   default: 0.0, null: false
    t.float    "longitude",  default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sites", ["comments"], name: "index_sites_on_comments", using: :btree
  add_index "sites", ["latitude", "longitude"], name: "index_sites_on_latitude_and_longitude", using: :btree
  add_index "sites", ["latitude"], name: "index_sites_on_latitude", using: :btree
  add_index "sites", ["longitude"], name: "index_sites_on_longitude", using: :btree
  add_index "sites", ["name", "latitude"], name: "index_sites_on_name_and_latitude", using: :btree
  add_index "sites", ["name", "longitude"], name: "index_sites_on_name_and_longitude", using: :btree
  add_index "sites", ["name"], name: "index_sites_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "", null: false
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "salutation",             default: "", null: false
    t.string   "suffix",                 default: "", null: false
    t.string   "name",                   default: "", null: false
    t.string   "image_url",              default: "", null: false
    t.string   "urls",                   default: "", null: false
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

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["first_name"], name: "index_users_on_first_name", using: :btree
  add_index "users", ["image_url"], name: "index_users_on_image_url", using: :btree
  add_index "users", ["last_name"], name: "index_users_on_last_name", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  add_index "users", ["salutation"], name: "index_users_on_salutation", using: :btree
  add_index "users", ["suffix"], name: "index_users_on_suffix", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", using: :btree
  add_index "users", ["urls"], name: "index_users_on_urls", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

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
    t.string   "vehicle_year",     default: "", null: false
    t.string   "vehicle_make",     default: "", null: false
    t.string   "vehicle_model",    default: "", null: false
    t.string   "vehicle_trim",     default: "", null: false
    t.string   "vehicle_type",     default: "", null: false
    t.string   "vehicle_door",     default: "", null: false
    t.string   "vehicle_size",     default: "", null: false
    t.string   "license_plate",    default: "", null: false
    t.string   "state_registered", default: "", null: false
    t.string   "color",            default: "", null: false
    t.text     "comments",         default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicles", ["color"], name: "index_vehicles_on_color", using: :btree
  add_index "vehicles", ["comments"], name: "index_vehicles_on_comments", using: :btree
  add_index "vehicles", ["license_plate", "color"], name: "index_vehicles_on_license_plate_and_color", using: :btree
  add_index "vehicles", ["license_plate", "state_registered"], name: "index_vehicles_on_license_plate_and_state_registered", using: :btree
  add_index "vehicles", ["license_plate"], name: "index_vehicles_on_license_plate", using: :btree
  add_index "vehicles", ["state_registered", "color"], name: "index_vehicles_on_state_registered_and_color", using: :btree
  add_index "vehicles", ["state_registered"], name: "index_vehicles_on_state_registered", using: :btree
  add_index "vehicles", ["vehicle_door", "color"], name: "index_vehicles_on_vehicle_door_and_color", using: :btree
  add_index "vehicles", ["vehicle_door", "license_plate"], name: "index_vehicles_on_vehicle_door_and_license_plate", using: :btree
  add_index "vehicles", ["vehicle_door", "state_registered"], name: "index_vehicles_on_vehicle_door_and_state_registered", using: :btree
  add_index "vehicles", ["vehicle_door", "vehicle_size"], name: "index_vehicles_on_vehicle_door_and_vehicle_size", using: :btree
  add_index "vehicles", ["vehicle_door"], name: "index_vehicles_on_vehicle_door", using: :btree
  add_index "vehicles", ["vehicle_make", "color"], name: "index_vehicles_on_vehicle_make_and_color", using: :btree
  add_index "vehicles", ["vehicle_make", "license_plate"], name: "index_vehicles_on_vehicle_make_and_license_plate", using: :btree
  add_index "vehicles", ["vehicle_make", "state_registered"], name: "index_vehicles_on_vehicle_make_and_state_registered", using: :btree
  add_index "vehicles", ["vehicle_make", "vehicle_door"], name: "index_vehicles_on_vehicle_make_and_vehicle_door", using: :btree
  add_index "vehicles", ["vehicle_make", "vehicle_model"], name: "index_vehicles_on_vehicle_make_and_vehicle_model", using: :btree
  add_index "vehicles", ["vehicle_make", "vehicle_size"], name: "index_vehicles_on_vehicle_make_and_vehicle_size", using: :btree
  add_index "vehicles", ["vehicle_make", "vehicle_trim"], name: "index_vehicles_on_vehicle_make_and_vehicle_trim", using: :btree
  add_index "vehicles", ["vehicle_make", "vehicle_type"], name: "index_vehicles_on_vehicle_make_and_vehicle_type", using: :btree
  add_index "vehicles", ["vehicle_make"], name: "index_vehicles_on_vehicle_make", using: :btree
  add_index "vehicles", ["vehicle_model", "color"], name: "index_vehicles_on_vehicle_model_and_color", using: :btree
  add_index "vehicles", ["vehicle_model", "license_plate"], name: "index_vehicles_on_vehicle_model_and_license_plate", using: :btree
  add_index "vehicles", ["vehicle_model", "state_registered"], name: "index_vehicles_on_vehicle_model_and_state_registered", using: :btree
  add_index "vehicles", ["vehicle_model", "vehicle_door"], name: "index_vehicles_on_vehicle_model_and_vehicle_door", using: :btree
  add_index "vehicles", ["vehicle_model", "vehicle_size"], name: "index_vehicles_on_vehicle_model_and_vehicle_size", using: :btree
  add_index "vehicles", ["vehicle_model", "vehicle_trim"], name: "index_vehicles_on_vehicle_model_and_vehicle_trim", using: :btree
  add_index "vehicles", ["vehicle_model", "vehicle_type"], name: "index_vehicles_on_vehicle_model_and_vehicle_type", using: :btree
  add_index "vehicles", ["vehicle_model"], name: "index_vehicles_on_vehicle_model", using: :btree
  add_index "vehicles", ["vehicle_size", "color"], name: "index_vehicles_on_vehicle_size_and_color", using: :btree
  add_index "vehicles", ["vehicle_size", "license_plate"], name: "index_vehicles_on_vehicle_size_and_license_plate", using: :btree
  add_index "vehicles", ["vehicle_size", "state_registered"], name: "index_vehicles_on_vehicle_size_and_state_registered", using: :btree
  add_index "vehicles", ["vehicle_size"], name: "index_vehicles_on_vehicle_size", using: :btree
  add_index "vehicles", ["vehicle_trim", "color"], name: "index_vehicles_on_vehicle_trim_and_color", using: :btree
  add_index "vehicles", ["vehicle_trim", "license_plate"], name: "index_vehicles_on_vehicle_trim_and_license_plate", using: :btree
  add_index "vehicles", ["vehicle_trim", "state_registered"], name: "index_vehicles_on_vehicle_trim_and_state_registered", using: :btree
  add_index "vehicles", ["vehicle_trim", "vehicle_door"], name: "index_vehicles_on_vehicle_trim_and_vehicle_door", using: :btree
  add_index "vehicles", ["vehicle_trim", "vehicle_size"], name: "index_vehicles_on_vehicle_trim_and_vehicle_size", using: :btree
  add_index "vehicles", ["vehicle_trim", "vehicle_type"], name: "index_vehicles_on_vehicle_trim_and_vehicle_type", using: :btree
  add_index "vehicles", ["vehicle_trim"], name: "index_vehicles_on_vehicle_trim", using: :btree
  add_index "vehicles", ["vehicle_type", "color"], name: "index_vehicles_on_vehicle_type_and_color", using: :btree
  add_index "vehicles", ["vehicle_type", "license_plate"], name: "index_vehicles_on_vehicle_type_and_license_plate", using: :btree
  add_index "vehicles", ["vehicle_type", "state_registered"], name: "index_vehicles_on_vehicle_type_and_state_registered", using: :btree
  add_index "vehicles", ["vehicle_type", "vehicle_door"], name: "index_vehicles_on_vehicle_type_and_vehicle_door", using: :btree
  add_index "vehicles", ["vehicle_type", "vehicle_size"], name: "index_vehicles_on_vehicle_type_and_vehicle_size", using: :btree
  add_index "vehicles", ["vehicle_type"], name: "index_vehicles_on_vehicle_type", using: :btree
  add_index "vehicles", ["vehicle_year", "color"], name: "index_vehicles_on_vehicle_year_and_color", using: :btree
  add_index "vehicles", ["vehicle_year", "license_plate"], name: "index_vehicles_on_vehicle_year_and_license_plate", using: :btree
  add_index "vehicles", ["vehicle_year", "state_registered"], name: "index_vehicles_on_vehicle_year_and_state_registered", using: :btree
  add_index "vehicles", ["vehicle_year", "vehicle_door"], name: "index_vehicles_on_vehicle_year_and_vehicle_door", using: :btree
  add_index "vehicles", ["vehicle_year", "vehicle_make"], name: "index_vehicles_on_vehicle_year_and_vehicle_make", using: :btree
  add_index "vehicles", ["vehicle_year", "vehicle_model"], name: "index_vehicles_on_vehicle_year_and_vehicle_model", using: :btree
  add_index "vehicles", ["vehicle_year", "vehicle_size"], name: "index_vehicles_on_vehicle_year_and_vehicle_size", using: :btree
  add_index "vehicles", ["vehicle_year", "vehicle_trim"], name: "index_vehicles_on_vehicle_year_and_vehicle_trim", using: :btree
  add_index "vehicles", ["vehicle_year", "vehicle_type"], name: "index_vehicles_on_vehicle_year_and_vehicle_type", using: :btree
  add_index "vehicles", ["vehicle_year"], name: "index_vehicles_on_vehicle_year", using: :btree

  add_foreign_key "accounts", "users"
  add_foreign_key "discounts", "accounts"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "service_plans"
  add_foreign_key "services", "service_plans"
  add_foreign_key "siteler_dollars", "accounts"
end
