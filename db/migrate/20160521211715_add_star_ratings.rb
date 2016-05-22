class AddStarRatings < ActiveRecord::Migration
  def change
    add_column :encounters, :a_ratings, :integer
    add_column :encounters, :d_ratings, :integer
  end
end
