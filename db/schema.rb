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

ActiveRecord::Schema.define(version: 2021_05_04_215300) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.text "ascii_model"
    t.boolean "intelligence"
    t.integer "hp"
    t.integer "armor"
    t.integer "speed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_characters_on_name", unique: true
  end

  create_table "environments", force: :cascade do |t|
    t.string "name"
    t.text "ascii_model"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_environments_on_name", unique: true
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.text "ascii_model"
    t.boolean "ranged"
    t.integer "hp"
    t.integer "armor"
    t.integer "damage"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_monsters_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.text "ascii_model"
    t.integer "damage"
    t.boolean "ranged"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "attack_speed"
    t.index ["name"], name: "index_weapons_on_name", unique: true
  end

end
