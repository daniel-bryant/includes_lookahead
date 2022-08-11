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

ActiveRecord::Schema[7.0].define(version: 2022_08_08_191139) do
  create_table "actors", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appearances", force: :cascade do |t|
    t.integer "film_id", null: false
    t.integer "role_id", null: false
    t.integer "actor_id", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_appearances_on_actor_id"
    t.index ["film_id"], name: "index_appearances_on_film_id"
    t.index ["role_id"], name: "index_appearances_on_role_id"
  end

  create_table "films", force: :cascade do |t|
    t.integer "studio_id", null: false
    t.string "name", null: false
    t.date "release_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_films_on_studio_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studios", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appearances", "actors"
  add_foreign_key "appearances", "films"
  add_foreign_key "appearances", "roles"
  add_foreign_key "films", "studios"
end
