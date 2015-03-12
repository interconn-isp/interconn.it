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

ActiveRecord::Schema.define(version: 20150312142125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "call_rates", force: :cascade do |t|
    t.string  "traffic_direction", limit: 255,                          null: false
    t.decimal "rate",                          precision: 10, scale: 8, null: false
    t.string  "time_slot",         limit: 255,                          null: false
  end

  create_table "inquiries", force: :cascade do |t|
    t.string   "full_name",  limit: 255, null: false
    t.string   "phone",      limit: 255, null: false
    t.string   "email",      limit: 255, null: false
    t.string   "address",    limit: 255, null: false
    t.string   "product",    limit: 255
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "sent_at"
    t.string   "referer"
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "full_name",  limit: 255, null: false
    t.string   "phone",      limit: 255
    t.string   "email",      limit: 255, null: false
    t.text     "message",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject",    limit: 255, null: false
    t.datetime "sent_at"
  end

end
