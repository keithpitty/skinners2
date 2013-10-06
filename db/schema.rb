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

ActiveRecord::Schema.define(version: 20131006005950) do

  create_table "holes", force: true do |t|
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_rounds", force: true do |t|
    t.integer  "player_id"
    t.integer  "round_id"
    t.boolean  "no_three_pointers"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "player_rounds", ["player_id"], name: "index_player_rounds_on_player_id"
  add_index "player_rounds", ["round_id"], name: "index_player_rounds_on_round_id"

  create_table "players", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "active"
    t.integer  "player_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", force: true do |t|
    t.date     "date_played"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", force: true do |t|
    t.integer  "player_id"
    t.integer  "round_id"
    t.integer  "player_round_id"
    t.integer  "hole_id"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scores", ["hole_id"], name: "index_scores_on_hole_id"
  add_index "scores", ["player_id"], name: "index_scores_on_player_id"
  add_index "scores", ["player_round_id"], name: "index_scores_on_player_round_id"
  add_index "scores", ["round_id"], name: "index_scores_on_round_id"

end
