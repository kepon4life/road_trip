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

ActiveRecord::Schema.define(version: 20140319054616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "place_types", force: true do |t|
    t.string   "name"
    t.string   "icon"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "places", force: true do |t|
    t.string  "name"
    t.string  "website"
    t.float   "lat"
    t.float   "lon"
    t.integer "rating"
    t.date    "start_date"
    t.date    "end_date"
    t.string  "album_flickr_nb"
    t.text    "comments"
    t.integer "parent_place_id"
    t.integer "place_type_id"
  end

  create_table "transportations", force: true do |t|
    t.string "name"
  end

  create_table "ways", force: true do |t|
    t.string  "name"
    t.date    "start_date"
    t.date    "end_date"
    t.string  "album_flickr_nb"
    t.text    "comments"
    t.integer "distance"
    t.text    "coordinates"
    t.integer "transportation_id"
  end

end
