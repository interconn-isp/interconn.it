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

ActiveRecord::Schema.define(version: 20141109153821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "call_rates", force: true do |t|
    t.string  "traffic_direction",                          null: false
    t.decimal "rate",              precision: 10, scale: 8, null: false
    t.string  "time_slot",                                  null: false
  end

  create_table "inquiries", force: true do |t|
    t.string   "full_name",  null: false
    t.string   "phone",      null: false
    t.string   "email",      null: false
    t.string   "address",    null: false
    t.string   "product"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "sent_at"
  end

  create_table "tickets", force: true do |t|
    t.string   "full_name",  null: false
    t.string   "phone"
    t.string   "email",      null: false
    t.text     "message",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject",    null: false
    t.string   "category",   null: false
  end

end
