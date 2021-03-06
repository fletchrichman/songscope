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

ActiveRecord::Schema.define(version: 20130721182659) do

  create_table "artist_genres", force: true do |t|
    t.string   "genre_id"
    t.string   "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artists", force: true do |t|
    t.string   "name"
    t.decimal  "hotness"
    t.string   "song_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "region_id"
  end

  create_table "genres", force: true do |t|
    t.string   "name"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artist_id"
  end

  create_table "regions", force: true do |t|
    t.string   "name"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_link"
    t.decimal  "hotness"
    t.string   "genre_overall"
  end

  create_table "songs", force: true do |t|
    t.string   "name"
    t.decimal  "hotness"
    t.string   "rdio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "artist_id"
  end

end
