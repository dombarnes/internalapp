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

ActiveRecord::Schema.define(:version => 20110324135202) do

  create_table "adhoc_supports", :force => true do |t|
    t.date     "date"
    t.string   "job_type"
    t.integer  "technicians"
    t.integer  "client_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "adhoc_supports", ["client_id"], :name => "index_adhoc_supports_on_client_id"

  create_table "clients", :force => true do |t|
    t.string   "client_name"
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "position"
    t.integer  "telephone_number"
    t.integer  "mobile_number"
    t.string   "source"
    t.string   "email_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  add_index "clients", ["company_id"], :name => "index_clients_on_company_id"

  create_table "companies", :force => true do |t|
    t.string   "company_name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "county"
    t.string   "postcode"
    t.string   "telephone_number"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "install_quotes", :force => true do |t|
    t.string   "customer_name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "install_quotes", ["user_id"], :name => "index_install_quotes_on_user_id"

  create_table "ios_quotes", :force => true do |t|
    t.string   "customer"
    t.integer  "user_id"
    t.integer  "device_quantity"
    t.boolean  "install_required"
    t.boolean  "support_required"
    t.boolean  "mobile_config"
    t.decimal  "install_cost"
    t.decimal  "decimal"
    t.decimal  "support_cost"
    t.integer  "ios_values_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ios_quotes", ["ios_values_id"], :name => "index_ios_quotes_on_ios_values_id"
  add_index "ios_quotes", ["ios_values_id"], :name => "index_ios_quotes_on_values_id"
  add_index "ios_quotes", ["user_id"], :name => "index_ios_quotes_on_user_id"

  create_table "ios_values", :force => true do |t|
    t.decimal  "daily_rate"
    t.boolean  "iosdevice_install_time"
    t.boolean  "iosdevice_support_cost"
    t.decimal  "iosdevice_install_setup"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "support_quotes", :force => true do |t|
    t.string   "customer_name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "support_quotes", ["user_id"], :name => "index_support_quotes_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login",                                      :null => false
    t.string   "email",                                      :null => false
    t.string   "crypted_password",                           :null => false
    t.string   "password_salt",                              :null => false
    t.string   "persistence_token",                          :null => false
    t.integer  "login_count",        :default => 0,          :null => false
    t.integer  "failed_login_count", :default => 0,          :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",             :default => false
    t.string   "role",               :default => "reseller"
    t.string   "perishable_token",   :default => "",         :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true

end
