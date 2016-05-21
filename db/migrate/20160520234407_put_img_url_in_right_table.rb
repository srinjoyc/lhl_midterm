class PutImgUrlInRightTable < ActiveRecord::Migration
  def change
    add_column :users, :img_url, :string
    add_column :encounters, :active, :boolean
    remove_column :encounters, :img_url
  end
end
