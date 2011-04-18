class CreateIosQuotes < ActiveRecord::Migration
  def self.up
    create_table :ios_quotes do |t|
      t.string :customer
      t.integer :user_id
      t.integer :device_quantity
      t.boolean :install_required
      t.boolean :support_required
      t.boolean :mobile_config
      t.decimal :install_cost, :decimal, {:scale => 2}
      t.decimal :support_cost, :decimal, {:scale => 2}
      t.integer :values_id
      
      t.timestamps
    end
    add_index :ios_quotes, :user_id
    add_index :ios_quotes, :values_id
  end

  def self.down
    drop_table :ios_quotes
  end
end