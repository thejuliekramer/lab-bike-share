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

ActiveRecord::Schema.define(version: 20140708172016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: true do |t|
    t.string   "type"
    t.boolean  "not_missing"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bike_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "accessories", ["bike_id"], name: "index_accessories_on_bike_id", using: :btree

  create_table "bikes", force: true do |t|
    t.string   "lock_password"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "checkouts", force: true do |t|
    t.integer  "user_id"
    t.integer  "bike_id"
    t.datetime "returned_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "checkouts", ["bike_id"], name: "index_checkouts_on_bike_id", using: :btree
  add_index "checkouts", ["user_id"], name: "index_checkouts_on_user_id", using: :btree

  create_table "cohorts", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cohorts", ["school_id"], name: "index_cohorts_on_school_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "commentable_id"
    t.string   "commentable_type"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "enrollments", force: true do |t|
    t.integer  "user_id"
    t.integer  "cohort_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.integer  "school_id"
  end

  add_index "enrollments", ["cohort_id"], name: "index_enrollments_on_cohort_id", using: :btree
  add_index "enrollments", ["role_id"], name: "index_enrollments_on_role_id", using: :btree
  add_index "enrollments", ["school_id"], name: "index_enrollments_on_school_id", using: :btree
  add_index "enrollments", ["user_id"], name: "index_enrollments_on_user_id", using: :btree

  create_table "invites", force: true do |t|
    t.string   "email"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "invites", ["school_id"], name: "index_invites_on_school_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subdomain"
  end

  add_index "schools", ["subdomain"], name: "index_schools_on_subdomain", unique: true, using: :btree

  create_table "submissions", force: true do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.text     "submission"
    t.boolean  "correctness"
    t.integer  "percieved_points"
    t.integer  "actual_points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "reviewed"
  end

  add_index "submissions", ["task_id"], name: "index_submissions_on_task_id", using: :btree
  add_index "submissions", ["user_id"], name: "index_submissions_on_user_id", using: :btree

  create_table "tasks", force: true do |t|
    t.text     "description"
    t.boolean  "visibility"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "tasks", ["unit_id"], name: "index_tasks_on_unit_id", using: :btree

  create_table "units", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "cohort_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "units", ["cohort_id"], name: "index_units_on_cohort_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
