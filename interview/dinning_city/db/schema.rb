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

ActiveRecord::Schema.define(version: 20140320110720) do

  create_table "distributors", force: true do |t|
    t.string "name"
  end

  create_table "promotions", force: true do |t|
    t.float    "discount"
    t.datetime "expired_at"
  end

  create_table "resturants", force: true do |t|
    t.string "name"
  end

  create_table "resturants_promotions", id: false, force: true do |t|
    t.integer "resturant_id"
    t.integer "promotion_id"
  end

  add_index "resturants_promotions", ["promotion_id"], name: "index_resturants_promotions_on_promotion_id"
  add_index "resturants_promotions", ["resturant_id"], name: "index_resturants_promotions_on_resturant_id"

end
