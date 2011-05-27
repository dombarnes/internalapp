class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    add_column :users, :role, :string, { :default => Role.find_by_name(:user)}
  end

  def self.down
    drop_table :roles
  end
end
