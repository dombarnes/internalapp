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

ActiveRecord::Schema.define(:version => 20110224121133) do

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

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
