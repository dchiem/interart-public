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

ActiveRecord::Schema.define(version: 20140521181858) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_pieces", force: true do |t|
  end

  create_table "categories_pieces_tables", force: true do |t|
    t.integer "category_id"
    t.integer "piece_id"
  end

  create_table "comments", force: true do |t|
    t.integer  "piece_id"
    t.integer  "piece_version_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "like_count"
  end

  create_table "piece_likes", force: true do |t|
    t.integer  "piece_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "piece_versions", force: true do |t|
    t.integer  "piece_id"
    t.integer  "version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "piece_img_file_name"
    t.string   "piece_img_content_type"
    t.integer  "piece_img_file_size"
    t.datetime "piece_img_updated_at"
  end

  create_table "pieces", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "view_count"
    t.text     "desired_feedback"
    t.text     "description"
    t.integer  "category_id"
  end

  create_table "pieces_tags", force: true do |t|
    t.integer "piece_id"
    t.integer "tag_id"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "password"
  end

end
