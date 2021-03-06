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

ActiveRecord::Schema.define(version: 20160521224955) do

  create_table "encounters", force: :cascade do |t|
    t.string   "defender_id"
    t.string   "attacker_id"
    t.string   "tier"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "location"
    t.string   "a_review"
    t.string   "d_review"
    t.integer  "a_damage"
    t.integer  "d_damage"
    t.boolean  "active"
    t.integer  "a_ratings"
    t.integer  "d_ratings"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.integer  "weight"
    t.integer  "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "img_url"
    t.string   "nickname"
    t.string   "hometown"
    t.integer  "age"
    t.integer  "reach"
    t.string   "bio"
  end

end
