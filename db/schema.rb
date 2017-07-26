ActiveRecord::Schema.define(version: 20170726004537) do

  enable_extension "plpgsql"

  create_table "clues", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "order"
    t.string   "task_type"
    t.integer  "hunt_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["hunt_id"], name: "index_clues_on_hunt_id", using: :btree
  end

  create_table "hunts", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "status",      default: "draft"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["user_id"], name: "index_hunts_on_user_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "access_code"
    t.integer  "hunt_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["hunt_id"], name: "index_teams_on_hunt_id", using: :btree
  end

  create_table "user_teams", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_user_teams_on_team_id", using: :btree
    t.index ["user_id"], name: "index_user_teams_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "role",            default: 0
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "clues", "hunts"
  add_foreign_key "hunts", "users"
  add_foreign_key "teams", "hunts"
  add_foreign_key "user_teams", "teams"
  add_foreign_key "user_teams", "users"
end
