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

ActiveRecord::Schema.define(version: 20180125195243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", id: :serial, force: :cascade do |t|
    t.string "file_name"
    t.string "file_uid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date", null: false
  end

  create_table "editable_fields", id: :serial, force: :cascade do |t|
    t.string "title", default: "", null: false
    t.text "content", default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_time"
    t.integer "duration", default: 0, null: false
  end

  create_table "images", id: :serial, force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "file_uid", null: false
    t.string "file_name", null: false
  end

  create_table "location_reservations", id: :serial, force: :cascade do |t|
    t.integer "location_id"
    t.integer "reservation_id"
    t.index ["location_id"], name: "index_location_reservations_on_location_id"
    t.index ["reservation_id"], name: "index_location_reservations_on_reservation_id"
  end

  create_table "locations", id: :serial, force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "menus", id: :serial, force: :cascade do |t|
    t.integer "parent_id"
    t.integer "page_id"
    t.integer "menu_type", null: false
    t.integer "position"
    t.string "link"
    t.string "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["page_id"], name: "index_menus_on_page_id"
    t.index ["parent_id"], name: "index_menus_on_parent_id"
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.text "content", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "permalink", null: false
    t.integer "position"
    t.integer "menu_id"
    t.index ["menu_id"], name: "index_pages_on_menu_id"
  end

  create_table "reservations", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.string "email", null: false
    t.text "comment", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date", null: false
    t.boolean "approved", default: false, null: false
    t.string "invoice_address", default: "", null: false
    t.integer "invoice_option"
  end

  create_table "role_memberships", id: :serial, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "role_name", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "location_reservations", "locations"
  add_foreign_key "location_reservations", "reservations"
end
