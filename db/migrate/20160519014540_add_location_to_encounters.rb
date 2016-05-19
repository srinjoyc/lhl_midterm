class AddLocationToEncounters < ActiveRecord::Migration
  def change
    add_column :encounters, :location, :string
   end
end
