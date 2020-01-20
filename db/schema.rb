# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_20_161445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clothing_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clothing_items", force: :cascade do |t|
    t.string "image_url"
    t.string "clothing_type"
    t.string "color"
    t.bigint "clothing_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["clothing_category_id"], name: "index_clothing_items_on_clothing_category_id"
    t.index ["user_id"], name: "index_clothing_items_on_user_id"
  end

  create_table "outfit_items", force: :cascade do |t|
    t.bigint "outfit_id", null: false
    t.bigint "clothing_item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clothing_item_id"], name: "index_outfit_items_on_clothing_item_id"
    t.index ["outfit_id"], name: "index_outfit_items_on_outfit_id"
  end

  create_table "outfits", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_outfits_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "clothing_items", "users"
  add_foreign_key "outfit_items", "clothing_items"
  add_foreign_key "outfit_items", "outfits"
  add_foreign_key "outfits", "users"
end
