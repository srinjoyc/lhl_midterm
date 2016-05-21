class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :hometown, :string
    add_column :users, :age, :integer
    add_column :users, :reach, :integer
  end
end
