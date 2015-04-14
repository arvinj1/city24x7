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

ActiveRecord::Schema.define(version: 20140314155252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ad_banner_items", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "link"
    t.integer  "ad_banner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fname"
  end

  add_index "ad_banner_items", ["ad_banner_id", "created_at"], name: "index_ad_banner_items_on_ad_banner_id_and_created_at", using: :btree

  create_table "ad_banners", force: true do |t|
    t.string   "name"
    t.integer  "counter"
    t.boolean  "selected"
    t.integer  "see"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "desttimes", force: true do |t|
    t.integer  "trip_id"
    t.string   "arrival"
    t.string   "departure"
    t.integer  "rail_stop_id"
    t.integer  "sequence"
    t.string   "headsign"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feed_entries", force: true do |t|
    t.string   "name"
    t.text     "summary"
    t.string   "url"
    t.datetime "published_at"
    t.string   "guid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source"
    t.string   "desc"
    t.string   "content"
  end

  create_table "feedtypes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "looper_items", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loopers", force: true do |t|
    t.string   "name"
    t.integer  "speed"
    t.string   "owner"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "selected"
  end

  create_table "pages", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon"
    t.boolean  "mappable"
    t.boolean  "searchable"
    t.string   "keywords"
    t.boolean  "isrootview"
    t.string   "searchType"
    t.string   "sec_icon"
    t.integer  "ad_banner_id"
    t.boolean  "is_banner_item"
    t.boolean  "rssable"
    t.boolean  "istransit"
    t.string   "loopImage"
  end

  add_index "pages", ["ancestry"], name: "index_pages_on_ancestry", using: :btree

  create_table "rail_stops", force: true do |t|
    t.string   "railstopuid"
    t.string   "name"
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", force: true do |t|
    t.string   "routeuuid"
    t.string   "short_name"
    t.string   "long_name"
    t.integer  "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dirxn"
  end

  create_table "stoptimes", force: true do |t|
    t.string   "tripuuid"
    t.string   "arrival"
    t.string   "departure"
    t.string   "rail_stop_id"
    t.integer  "sequence"
    t.string   "headsign"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.integer  "route_id"
    t.string   "service_id"
    t.string   "tripuuid"
    t.string   "headsign"
    t.integer  "direction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "ipaddress"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
