class AddSingleAccessTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :single_access_token, :string, null: false
    add_index :users, :persistence_token, unique: true
  end
end
