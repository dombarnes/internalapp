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

ActiveRecord::Schema.define(version: 20160329125706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adhoc_supports", force: :cascade do |t|
    t.date     "date",        null: false
    t.string   "job_type",    null: false
    t.integer  "technicians", null: false
    t.integer  "company_id",  null: false
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invoice_id"
  end

  add_index "adhoc_supports", ["company_id"], name: "index_adhoc_supports_on_company_id", using: :btree
  add_index "adhoc_supports", ["invoice_id"], name: "index_adhoc_supports_on_invoice_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "company_name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "county"
    t.string   "postcode"
    t.string   "telephone_number"
    t.string   "website"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company_type"
    t.string   "permalink"
  end

  create_table "company_types", force: :cascade do |t|
    t.string   "company_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contracts", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "contract_type"
    t.decimal  "cost"
    t.string   "contract_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "ios_quotes", force: :cascade do |t|
    t.string   "customer"
    t.integer  "device_quantity"
    t.boolean  "install_required"
    t.boolean  "support_required"
    t.boolean  "mobile_config"
    t.decimal  "install_cost",     precision: 2, scale: 2
    t.decimal  "support_cost",     precision: 2, scale: 2
    t.integer  "user_id"
    t.integer  "ios_values_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ios_quotes", ["ios_values_id"], name: "index_ios_quotes_on_ios_values_id", using: :btree
  add_index "ios_quotes", ["user_id"], name: "index_ios_quotes_on_user_id", using: :btree

  create_table "ios_values", force: :cascade do |t|
    t.decimal  "daily_rate"
    t.decimal  "iosdevice_install_time"
    t.decimal  "iosdevice_support_cost"
    t.decimal  "iosdevice_install_setup"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mac_quotes", force: :cascade do |t|
    t.string   "customer_name"
    t.integer  "client_quantity"
    t.integer  "server_quantity"
    t.integer  "new_user_setup"
    t.boolean  "ad_integration"
    t.boolean  "deploy_studio_setup"
    t.decimal  "airport_setup"
    t.decimal  "print_server"
    t.boolean  "iwork"
    t.boolean  "office"
    t.boolean  "fce"
    t.boolean  "fcp"
    t.boolean  "ard"
    t.boolean  "logicx"
    t.boolean  "logicp"
    t.boolean  "cs5"
    t.boolean  "aperture"
    t.decimal  "install_cost"
    t.decimal  "support_cost"
    t.string   "status"
    t.integer  "user_id"
    t.integer  "mac_values_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mac_quotes", ["mac_values_id"], name: "index_mac_quotes_on_mac_values_id", using: :btree
  add_index "mac_quotes", ["user_id"], name: "index_mac_quotes_on_user_id", using: :btree

  create_table "mac_values", force: :cascade do |t|
    t.decimal  "mac_install_time"
    t.decimal  "server_install_time"
    t.decimal  "new_user_setup_time"
    t.decimal  "ad_integration_time"
    t.decimal  "deploy_studio_setup_time"
    t.decimal  "airport_setup_time"
    t.decimal  "print_server_time"
    t.decimal  "iwork_time"
    t.decimal  "office_time"
    t.decimal  "fce_time"
    t.decimal  "fcp_time"
    t.decimal  "ard_time"
    t.decimal  "logicx_time"
    t.decimal  "logicp_time"
    t.decimal  "cs5_time"
    t.decimal  "aperture_time"
    t.decimal  "consulting_time"
    t.decimal  "documentation_time"
    t.decimal  "halfday_price"
    t.decimal  "day_rate"
    t.decimal  "mac_support_cost"
    t.decimal  "server_support_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "people_id"
    t.integer  "contract_id"
    t.integer  "adhoc_supports_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: :cascade do |t|
    t.string   "title"
    t.string   "first_name",       null: false
    t.string   "last_name",        null: false
    t.string   "position"
    t.string   "telephone_number"
    t.string   "mobile_number"
    t.string   "email_address",    null: false
    t.string   "website"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "county"
    t.string   "postcode"
    t.integer  "company_id",       null: false
    t.text     "bio"
    t.string   "im"
    t.string   "linkedin"
    t.string   "twitter"
    t.string   "customer_id"
    t.string   "referred_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["company_id"], name: "index_people_on_company_id", using: :btree

  create_table "role_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_sessions", ["session_id"], name: "index_user_sessions_on_session_id", using: :btree
  add_index "user_sessions", ["updated_at"], name: "index_user_sessions_on_updated_at", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: "",    null: false
    t.string   "first_name",          default: "",    null: false
    t.string   "last_name",           default: "",    null: false
    t.string   "company_name"
    t.string   "job_title"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "active",              default: false
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "perishable_token",    default: "",    null: false
    t.string   "single_access_token",                 null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["perishable_token"], name: "index_users_on_perishable_token", using: :btree
  add_index "users", ["persistence_token"], name: "index_users_on_persistence_token", unique: true, using: :btree

end
