class SimplifiedTables < ActiveRecord::Migration
  def change
    create_table "encounters", force: :cascade do |t|
      t.string   "defender_id"
      t.string   "attacker_id"
      t.string   "expires"
      t.string   "tier"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string   "location"
    end

    create_table "users", force: :cascade do |t|
      t.string   "username"
      t.string   "password"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
