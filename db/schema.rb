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

ActiveRecord::Schema.define(version: 20181027220339) do

  create_table "matchups", force: :cascade do |t|
    t.string   "team1"
    t.string   "team2"
    t.string   "line1"
    t.string   "line2"
    t.string   "price1"
    t.string   "price2"
    t.integer  "consensus"
    t.string   "betType"
    t.string   "lineType"
    t.string   "team1P"
    t.string   "team2P"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
