class CreateMacValues < ActiveRecord::Migration
  def self.up
    create_table :mac_values do |t|
      t.decimal   :mac_install_time
      t.decimal   :server_install_time
      t.decimal   :new_user_setup_time
      t.decimal   :ad_integration_time
      t.decimal   :deploy_studio_setup_time
      t.decimal   :airport_setup_time
      t.decimal   :print_server_time
      t.decimal   :iwork_time
      t.decimal   :office_time
      t.decimal   :fce_time
      t.decimal   :fcp_time
      t.decimal   :ard_time
      t.decimal   :logicx_time
      t.decimal   :logicp_time
      t.decimal   :cs5_time
      t.decimal   :aperture_time
      t.decimal   :consulting_time
      t.decimal   :documentation_time
      t.decimal   :halfday_price
      t.decimal   :day_rate
      t.decimal   :mac_support_cost
      t.decimal   :server_support_cost
      
      t.timestamps      
    end
  end

  def self.down
    drop_table :mac_values
  end
end
