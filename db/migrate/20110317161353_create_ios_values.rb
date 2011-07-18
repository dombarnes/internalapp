class CreateIosValues < ActiveRecord::Migration
  def self.up
    create_table :ios_values do |t|
      t.decimal :daily_rate
      t.decimal :iosdevice_install_time
      t.decimal :iosdevice_support_cost
      t.decimal :iosdevice_install_setup
      
      t.timestamps
    end      
  end

  def self.down
    drop_table :ios_values
  end
end
