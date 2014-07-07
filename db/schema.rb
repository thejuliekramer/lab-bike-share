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

ActiveRecord::Schema.define(version: 20140707222241) do

  create_table "accessories", force: true do |t|
    t.string   "type"
    t.boolean  "not_missing"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bike_id"
  end

  add_index "accessories", ["bike_id"], name: "index_accessories_on_bike_id"

  create_table "bikes", force: true do |t|
    t.string   "lock_password"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checkouts", force: true do |t|
    t.integer  "user_id"
    t.integer  "bike_id"
    t.datetime "returned_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "checkouts", ["bike_id"], name: "index_checkouts_on_bike_id"
  add_index "checkouts", ["user_id"], name: "index_checkouts_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
