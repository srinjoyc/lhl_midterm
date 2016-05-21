class PutImgUrlInRightTable < ActiveRecord::Migration
  def change
    add_column :users, :img_url, :string
    remove_column :encounters, :img_url
  end
end
