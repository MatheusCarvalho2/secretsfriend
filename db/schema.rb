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

ActiveRecord::Schema[7.1].define(version: 2025_03_07_122216) do
  create_table "draws", force: :cascade do |t|
    t.string "title"
    t.string "min_value"
    t.string "max_value"
    t.datetime "date_draws"
    t.datetime "date_present"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.string "location"
    t.text "other_information"
    t.index ["user_id"], name: "index_draws_on_user_id"
  end

  create_table "match_friends", force: :cascade do |t|
    t.integer "draw_id", null: false
    t.integer "participant1_id", null: false
    t.integer "participant2_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["draw_id"], name: "index_match_friends_on_draw_id"
    t.index ["participant1_id"], name: "index_match_friends_on_participant1_id"
    t.index ["participant2_id"], name: "index_match_friends_on_participant2_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.integer "draw_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["draw_id"], name: "index_participants_on_draw_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "jti"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "draws", "users"
  add_foreign_key "match_friends", "draws"
  add_foreign_key "match_friends", "participants", column: "participant1_id"
  add_foreign_key "match_friends", "participants", column: "participant2_id"
  add_foreign_key "participants", "draws"
end
