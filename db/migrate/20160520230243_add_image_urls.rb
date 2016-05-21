class AddImageUrls < ActiveRecord::Migration
  def change
    add_column :encounters, :img_url, :string
  end
end
