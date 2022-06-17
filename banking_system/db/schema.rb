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

ActiveRecord::Schema.define(version: 20181005060153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "account_transactions", force: :cascade do |t|
    t.datetime "transaction_date"
    t.float    "withdraw"
    t.float    "deposit"
    t.string   "remark"
    t.integer  "account_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.bigint   "accnt_number"
    t.float    "balance"
    t.integer  "user_id"
    t.boolean  "verify"
    t.string   "verified_by"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "banks", force: :cascade do |t|
    t.string   "bank_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "beneficiery_accounts", force: :cascade do |t|
    t.integer  "account_id"
    t.bigint   "beneficiery_account_no"
    t.bigint   "confirm_account_no"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "imagable_type"
    t.integer  "imagable_id"
    t.string   "image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "local_addresses", force: :cascade do |t|
    t.string   "house_name"
    t.string   "street_no"
    t.string   "area"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "pin_code"
    t.string   "address_proof"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "managers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permanent_addresses", force: :cascade do |t|
    t.string   "house_name"
    t.string   "street_no"
    t.string   "area"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "pin_code"
    t.string   "address_proof"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "role",                   default: "user"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "father_name"
    t.string   "mother_name"
    t.string   "occupation"
    t.string   "father_occupation"
    t.string   "mother_occupation"
    t.bigint   "mobile_number"
    t.bigint   "aadhar_no"
    t.string   "pan_no"
    t.string   "gender"
    t.integer  "bank_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
