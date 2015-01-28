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

ActiveRecord::Schema.define(version: 20150128121119) do

  create_table "contents", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "contents"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simply_pages_file_groups", force: :cascade do |t|
    t.string  "title",          limit: 255
    t.integer "parent_id"
    t.integer "position"
    t.integer "children_count",             default: 0, null: false
    t.integer "lft",                                    null: false
    t.integer "rgt",                                    null: false
  end

  create_table "simply_pages_files", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "caption",            limit: 255
    t.string   "media_file_name",    limit: 255
    t.string   "media_content_type", limit: 255
    t.integer  "media_file_size"
    t.integer  "file_group_id"
    t.string   "image_dimensions",   limit: 30
    t.string   "resized_dimensions", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simply_pages_pages", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.string   "slug",            limit: 255
    t.text     "content"
    t.integer  "parent_id"
    t.integer  "position"
    t.integer  "lft",                                     null: false
    t.integer  "rgt",                                     null: false
    t.integer  "children_count",              default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "depth",                       default: 0
    t.integer  "navigation_type",             default: 0
  end

end
