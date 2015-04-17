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

ActiveRecord::Schema.define(version: 20150326040615) do

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "application_medications_rx_norms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "application_patients", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "application_pharm_manufacturers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applications", force: :cascade do |t|
    t.integer  "patientsptid"
    t.integer  "pharmmanufacturersphid"
    t.string   "medicationsrxnormndc"
    t.string   "appstatus"
    t.date     "dateinit"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "dispensed_med_inventories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dispensed_med_patients", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dispensed_meds", force: :cascade do |t|
    t.date     "disdate"
    t.integer  "patientsid"
    t.integer  "inventoryid", limit: 20
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "invid",                limit: 20
    t.string   "lotno"
    t.date     "expdate"
    t.string   "currentstock"
    t.string   "inventorytype"
    t.date     "datetoreorder"
    t.string   "medicationsrxnormndc"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "inventory_medications_rx_norms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medications_rx_norm_pharm_manufacturers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medications_rx_norms", force: :cascade do |t|
    t.string   "ndc"
    t.string   "medname"
    t.string   "minstock"
    t.integer  "pharmmanufacturersphid"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "patients", force: :cascade do |t|
    t.integer  "ptid"
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
    t.integer  "phid"
    t.string   "manufacturer"
    t.string   "minincome"
    t.string   "monthsreorder"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "prescription_medications_rx_norms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prescription_patients", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prescription_providers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prescriptions", force: :cascade do |t|
    t.integer  "rxid"
    t.string   "dose"
    t.string   "frequencytaken"
    t.string   "routetaken"
    t.date     "dategiven"
    t.string   "medicationsrxnormndc"
    t.integer  "providersdrid"
    t.integer  "patientsptid"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "providers", force: :cascade do |t|
    t.integer  "drid"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
