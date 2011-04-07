class CreateIosValues < ActiveRecord::Migration
  def self.up
    create_table :ios_values do |t|
      t.decimal :daily_rate
      t.boolean :iosdevice_install_time
      t.boolean :iosdevice_support_cost
      t.decimal :iosdevice_install_setup
      
      t.timestamps
    end      

    rename_column  :ios_quotes, :values_id, :ios_values_id
    add_index :ios_quotes, :ios_values_id
  end

  def self.down
    drop_table :ios_values
  end
end
