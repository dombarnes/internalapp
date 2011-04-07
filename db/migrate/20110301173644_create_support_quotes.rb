class CreateSupportQuotes < ActiveRecord::Migration
  def self.up
    create_table :support_quotes do |t|
      t.string :customer_name
      t.integer :user_id
      t.timestamps
    end
    add_index :support_quotes, :user_id
  end

  def self.down
    drop_table :support_quotes
  end
end
