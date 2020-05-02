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

ActiveRecord::Schema.define(version: 2020_05_01_095104) do

  create_table "problems", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "translation_id"
    t.datetime "pulled_at"
    t.string "original_title"
    t.text "original_content"
    t.index ["translation_id"], name: "index_problems_on_translation_id"
  end

  create_table "translations", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "problem_id"
    t.integer "status", default: 0
    t.integer "author_id"
    t.index ["author_id"], name: "index_translations_on_author_id"
    t.index ["problem_id"], name: "index_translations_on_problem_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", null: false
    t.string "uid", null: false
    t.integer "role", default: 0
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "remember_token"
  end

end
