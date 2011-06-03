class ChangeIosValuesDataTypes < ActiveRecord::Migration
  def self.up
    change_column :ios_values, :iosdevice_support_cost, :decimal
    change_column :ios_values, :iosdevice_install_time, :decimal
  end

  def self.down
    change_column :ios_values, :iosdevice_support_cost, :boolean
    change_column :ios_values, :iosdevice_install_time, :boolean    
  end
end
