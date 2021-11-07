# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_07_171029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carbon_footprints", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carbon_footprints_on_user_id"
  end

  create_table "examples", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "star"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transport_footprints", force: :cascade do |t|
    t.bigint "carbon_footprint_id", null: false
    t.integer "weekly_km_car", default: 0
    t.integer "vehicle_efficiency", default: 0
    t.integer "weekly_km_bus", default: 0
    t.integer "weekly_km_metro", default: 0
    t.integer "weekly_km_train", default: 0
    t.integer "short_flights_year", default: 0
    t.integer "long_flights_year", default: 0
    t.string "vehicle_fuel", default: "gasolina"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["carbon_footprint_id"], name: "index_transport_footprints_on_carbon_footprint_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "guest", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "carbon_footprints", "users"
  add_foreign_key "transport_footprints", "carbon_footprints"
end
