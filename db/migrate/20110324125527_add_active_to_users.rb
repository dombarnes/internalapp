class AddActiveToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :active, :boolean, { :default => false }
    add_column :users, :role, :string, { :default => 'reseller'}
  end

  def self.down
    remove_column :users, :active
    remove_colum :users, :role
  end
end
