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
    t.integer  "patients_id"
    t.integer  "pharm_manufacturers_id"
    t.integer  "medications_rx_norms_id"
    t.string   "app_status"
    t.date     "date_init"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "applications", ["medications_rx_norms_id"], name: "index_applications_on_medications_rx_norms_id"
  add_index "applications", ["patients_id"], name: "index_applications_on_patients_id"
  add_index "applications", ["pharm_manufacturers_id"], name: "index_applications_on_pharm_manufacturers_id"

  create_table "dispensed_meds", force: :cascade do |t|
    t.date     "dis_date"
    t.integer  "patients_id"
    t.integer  "inventories_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "dispensed_meds", ["inventories_id"], name: "index_dispensed_meds_on_inventories_id"
  add_index "dispensed_meds", ["patients_id"], name: "index_dispensed_meds_on_patients_id"

  create_table "inventories", force: :cascade do |t|
    t.integer  "invID"
    t.string   "lot_no"
    t.date     "exp_date"
    t.string   "current_stock"
    t.string   "type"
    t.string   "date_to_reorder"
    t.integer  "medications_rx_norms_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "inventories", ["medications_rx_norms_id"], name: "index_inventories_on_medications_rx_norms_id"

  create_table "medications_rx_norms", force: :cascade do |t|
    t.string   "ndc"
    t.string   "med_name"
    t.string   "min_stock"
    t.integer  "pharm_manufacturers_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "medications_rx_norms", ["pharm_manufacturers_id"], name: "index_medications_rx_norms_on_pharm_manufacturers_id"

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
    t.integer  "medications_rx_norms_id"
    t.integer  "providers_id"
    t.integer  "patients_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "prescriptions", ["medications_rx_norms_id"], name: "index_prescriptions_on_medications_rx_norms_id"
  add_index "prescriptions", ["patients_id"], name: "index_prescriptions_on_patients_id"
  add_index "prescriptions", ["providers_id"], name: "index_prescriptions_on_providers_id"

  create_table "providers", force: :cascade do |t|
    t.integer  "drID"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
