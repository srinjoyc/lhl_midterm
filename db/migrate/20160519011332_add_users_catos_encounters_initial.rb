class AddUsersCatosEncountersInitial < ActiveRecord::Migration
  def change
    create_table "users" do |t|
      t.string "username"
      t.string "password"
      t.timestamps null: false
    end #create_table "users"

    create_table "encounters" do |t|
      t.references :attacker
      t.references :defender
      t.string "date"
      t.string "tier"
      t.timestamps null: false
      #TODO: Add timeframe stuff
    end #create_table "encounters"

  end
end
