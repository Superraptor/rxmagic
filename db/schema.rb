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

ActiveRecord::Schema.define(version: 20150205224003) do

  create_table "applications", force: :cascade do |t|
    t.belongs_to  "patients"
    t.belongs_to  "pharm_manufacturers"
    t.belongs_to   "medications_rx_norms"
    t.string   "app_status"
    t.date     "date_init"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "dispensed_meds", force: :cascade do |t|
    t.date     "dis_date"
    t.belongs_to  "patients"
    t.belongs_to  "inventories"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "invID"
    t.string   "lot_no"
    t.date     "exp_date"
    t.string   "current_stock"
    t.string   "type"
    t.string   "date_to_reorder"
    t.belongs_to   "medications_rx_norms"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "medications_rx_norms", force: :cascade do |t|
    t.string   "ndc"
    t.string   "med_name"
    t.string   "min_stock"
    t.belongs_to  "pharm_manufacturers"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "patients", force: :cascade do |t|
    t.integer  "ptID"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "gender"
    t.string   "dob"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pharm_manufacturers", force: :cascade do |t|
    t.integer  "phID"
    t.string   "manufacturer"
    t.string   "min_income"
    t.string   "months_reorder"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "prescriptions", force: :cascade do |t|
    t.integer  "rxID"
    t.string   "dose"
    t.string   "frequency"
    t.string   "route"
    t.date     "date"
    t.belongs_to   "medications_rx_norms"
    t.belongs_to  "providers"
    t.belongs_to  "patients"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "providers", force: :cascade do |t|
    t.integer  "drID"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
