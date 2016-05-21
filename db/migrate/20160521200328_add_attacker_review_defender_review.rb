class AddAttackerReviewDefenderReview < ActiveRecord::Migration
  def change
    add_column :encounters, :a_review, :string
    add_column :encounters, :d_review, :string
    add_column :encounters, :active, :boolean
    add_column :encounters, :a_damage, :integer
    add_column :encounters, :d_damage, :integer

  end
end
