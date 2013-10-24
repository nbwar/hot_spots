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

ActiveRecord::Schema.define(version: 20130915161124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foursquare_users", force: true do |t|
    t.string   "foursquare_id"
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "foursquare_users", ["foursquare_id"], name: "index_foursquare_users_on_foursquare_id", using: :btree

  create_table "phone_numbers", force: true do |t|
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_numbers_venues", force: true do |t|
    t.integer "phone_number_id"
    t.integer "venue_id"
  end

  create_table "snapshots", force: true do |t|
    t.float    "checkin_count"
    t.float    "short_ema"
    t.float    "long_ema"
    t.float    "macd"
    t.float    "signal_line"
    t.float    "histogram"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "venue_id"
  end

  create_table "venues", force: true do |t|
    t.string   "fsq_id"
    t.string   "fsq_category_id"
    t.string   "fsq_neighborhood_id"
    t.float    "highest_count",       default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.float    "checkin_count"
    t.float    "histogram"
  end

end
