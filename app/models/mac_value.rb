class MacValue < ActiveRecord::Base
  attr_accessible :mac_install_time, :server_install_time, :new_user_setup_time, :ad_integration_time, :deploy_studio_setup_time, :print_server_time, :iwork_time, :office_time, :fce_time, :fcp_time, :ard_time, :logicx_time, :logicp_time, :cs5_time, :aperture_time, :documentation_time, :halfday_price, :day_rate, :mac_support_cost, :server_support_cost

  validates_presence_of :mac_install_time, :server_install_time, :new_user_setup_time, :ad_integration_time, :deploy_studio_setup_time, :print_server_time, :iwork_time, :office_time, :fce_time, :fcp_time, :ard_time, :logicx_time, :logicp_time, :cs5_time, :aperture_time, :documentation_time, :halfday_price, :day_rate, :mac_support_cost, :server_support_cost

 has_many :mac_quotes
 # scope :recent, order('created_at ASC')
 
end
