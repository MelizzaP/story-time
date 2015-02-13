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

ActiveRecord::Schema.define(version: 20150212193415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tales", force: :cascade do |t|
    t.text     "inspiration"
    t.text     "story_type"
    t.boolean  "public_access"
    t.text     "content"
    t.text     "title"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "user_tales", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_tales", ["tale_id"], name: "index_user_tales_on_tale_id", using: :btree
  add_index "user_tales", ["user_id"], name: "index_user_tales_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.text     "email"
    t.text     "username"
    t.text     "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_tales", "tales"
  add_foreign_key "user_tales", "users"
end
