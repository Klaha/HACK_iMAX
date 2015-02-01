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

ActiveRecord::Schema.define(version: 20150201171656) do

  create_table "configs", force: true do |t|
    t.float    "price_ticket_type_1"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", force: true do |t|
    t.string   "name"
    t.string   "sinopsis"
    t.time     "duration"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seat_shows", force: true do |t|
    t.integer "show_id"
    t.integer "seat_id"
    t.integer "ticket_id"
    t.string  "status"
  end

  add_index "seat_shows", ["seat_id"], name: "index_seat_shows_on_seat_id"
  add_index "seat_shows", ["show_id"], name: "index_seat_shows_on_show_id"
  add_index "seat_shows", ["ticket_id"], name: "index_seat_shows_on_ticket_id"

  create_table "seats", force: true do |t|
    t.string  "row"
    t.integer "col"
  end

  create_table "settings", force: true do |t|
    t.float    "price_ticket_type_1"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "show_transactions", force: true do |t|
    t.integer  "user_id"
    t.integer  "show_id"
    t.datetime "datetime_transaction"
    t.string   "status"
  end

  add_index "show_transactions", ["show_id"], name: "index_show_transactions_on_show_id"
  add_index "show_transactions", ["user_id"], name: "index_show_transactions_on_user_id"

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
    t.string   "type_theater"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.integer "show_transaction_id"
    t.string  "type_ticket"
    t.float   "price"
  end

  add_index "tickets", ["show_transaction_id"], name: "index_tickets_on_show_transaction_id"

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
