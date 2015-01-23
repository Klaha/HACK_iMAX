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

ActiveRecord::Schema.define(version: 20150121203112) do

  create_table "movies", force: true do |t|
    t.string   "name"
    t.string   "sinopsis"
    t.time     "duration"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shows", force: true do |t|
    t.integer  "movie_id"
    t.time     "time"
    t.integer  "theater_id"
    t.date     "date_show"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shows", ["movie_id"], name: "index_shows_on_movie_id"

  create_table "theaters", force: true do |t|
    t.integer  "theater_number"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "ci"
    t.string   "email"
    t.string   "password"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
