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
    t.integer  "trackable_id",   limit: 4
    t.string   "trackable_type", limit: 255
    t.integer  "owner_id",       limit: 4
    t.string   "owner_type",     limit: 255
    t.string   "key",            limit: 255
    t.text     "parameters",     limit: 65535
    t.integer  "recipient_id",   limit: 4
    t.string   "recipient_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "application_medications_rx_norms", force: :cascade do |t|
    t.integer  "application_id", limit: 4
    t.integer  "medication_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "application_patients", force: :cascade do |t|
    t.integer  "application_id", limit: 4
    t.integer  "patient_id",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "application_pharm_manufacturers", force: :cascade do |t|
    t.integer  "application_id",  limit: 4
    t.integer  "manufacturer_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "applications", force: :cascade do |t|
    t.integer  "patientsptid",           limit: 4
    t.integer  "pharmmanufacturersphid", limit: 4
    t.string   "medicationsrxnormndc",   limit: 255
    t.string   "appstatus",              limit: 255
    t.date     "dateinit"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "dispensed_med_inventories", force: :cascade do |t|
    t.integer  "inventory_id",     limit: 4
    t.integer  "dispensed_med_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "dispensed_med_patients", force: :cascade do |t|
    t.integer  "patient_id",       limit: 4
    t.integer  "dispensed_med_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "dispensed_meds", force: :cascade do |t|
    t.date     "disdate"
    t.integer  "patientsid",  limit: 4
    t.integer  "inventoryid", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "quantity",    limit: 4
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "invid",                limit: 4
    t.string   "lotno",                limit: 255
    t.date     "expdate"
    t.string   "currentstock",         limit: 255
    t.string   "inventorytype",        limit: 255
    t.date     "datetoreorder"
    t.string   "medicationsrxnormndc", limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "inventory_medications_rx_norms", force: :cascade do |t|
    t.integer  "inventory_id",  limit: 4
    t.integer  "medication_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "medications_rx_norm_pharm_manufacturers", force: :cascade do |t|
    t.integer  "medication_id",   limit: 4
    t.integer  "manufacturer_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "medications_rx_norms", force: :cascade do |t|
    t.string   "ndc",                    limit: 255
    t.string   "medname",                limit: 255
    t.string   "minstock",               limit: 255
    t.integer  "pharmmanufacturersphid", limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "patients", force: :cascade do |t|
    t.integer  "ptid",       limit: 4
    t.string   "firstname",  limit: 255
    t.string   "lastname",   limit: 255
    t.string   "gender",     limit: 255
    t.string   "dob",        limit: 255
    t.string   "address",    limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.string   "zip",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pharm_manufacturers", force: :cascade do |t|
    t.integer  "phid",          limit: 4
    t.string   "manufacturer",  limit: 255
    t.string   "minincome",     limit: 255
    t.string   "monthsreorder", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "prescription_medications_rx_norms", force: :cascade do |t|
    t.integer  "prescription_id", limit: 4
    t.integer  "medication_id",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "prescription_patients", force: :cascade do |t|
    t.integer  "prescription_id", limit: 4
    t.integer  "patient_id",      limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "prescription_providers", force: :cascade do |t|
    t.integer  "prescription_id", limit: 4
    t.integer  "provider_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "prescriptions", force: :cascade do |t|
    t.integer  "rxid",                 limit: 4
    t.string   "dose",                 limit: 255
    t.string   "frequencytaken",       limit: 255
    t.string   "routetaken",           limit: 255
    t.date     "dategiven"
    t.string   "medicationsrxnormndc", limit: 255
    t.integer  "providersdrid",        limit: 4
    t.integer  "patientsptid",         limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "providers", force: :cascade do |t|
    t.integer  "drid",       limit: 4
    t.string   "firstname",  limit: 255
    t.string   "lastname",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
