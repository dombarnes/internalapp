class CreateInstallQuotes < ActiveRecord::Migration
  def self.up
    create_table :install_quotes do |t|
      t.string :customer_name
      t.integer :user_id
      t.timestamps
    end
    add_index :install_quotes, :user_id
  end

  def self.down
    drop_table :install_quotes
  end
end
