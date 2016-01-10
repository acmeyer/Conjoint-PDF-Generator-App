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

ActiveRecord::Schema.define(version: 20160109202812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conjoint_attribute_values", force: :cascade do |t|
    t.string   "level"
    t.integer  "conjoint_attribute_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "conjoint_attribute_values", ["conjoint_attribute_id"], name: "index_conjoint_attribute_values_on_conjoint_attribute_id", using: :btree

  create_table "conjoint_attributes", force: :cascade do |t|
    t.string   "name"
    t.integer  "conjoint_experiment_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "conjoint_attributes", ["conjoint_experiment_id"], name: "index_conjoint_attributes_on_conjoint_experiment_id", using: :btree

  create_table "conjoint_experiments", force: :cascade do |t|
    t.string   "name_of_choice_1"
    t.string   "name_of_choice_2"
    t.string   "number_of_rounds"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "name"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "trials", force: :cascade do |t|
    t.string   "uid"
    t.integer  "conjoint_experiment_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.json     "data"
  end

end
