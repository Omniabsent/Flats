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

ActiveRecord::Schema.define(version: 2021_10_07_021516) do

  create_table "place_owners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_place_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_place_owners_on_reset_password_token", unique: true
  end

  create_table "place_regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "place_reservations", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "guests"
    t.decimal "total_value"
    t.integer "place_id", null: false
    t.integer "visitor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id"], name: "index_place_reservations_on_place_id"
    t.index ["visitor_id"], name: "index_place_reservations_on_visitor_id"
  end

  create_table "place_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "rooms"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "bathrooms"
    t.boolean "pets"
    t.boolean "parking_slot"
    t.integer "rent"
    t.integer "place_type_id", null: false
    t.integer "place_region_id", null: false
    t.integer "place_owner_id", null: false
    t.index ["place_owner_id"], name: "index_places_on_place_owner_id"
    t.index ["place_region_id"], name: "index_places_on_place_region_id"
    t.index ["place_type_id"], name: "index_places_on_place_type_id"
  end

  create_table "visitors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_visitors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_visitors_on_reset_password_token", unique: true
  end

  add_foreign_key "place_reservations", "places"
  add_foreign_key "place_reservations", "visitors"
  add_foreign_key "places", "place_owners"
  add_foreign_key "places", "place_regions"
  add_foreign_key "places", "place_types"
end
