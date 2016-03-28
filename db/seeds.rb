# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# roles = Role.create([
#   {title: 'admin'},
#   {title: 'user'}
# ]) if Role.count == 0

# create roles
admin_role = Role.create( :title => "admin", :created_at => Time.now)
staff_role = Role.create( :title => "staff", :created_at => Time.now)
user_role  = Role.create( :title => "user", :created_at => Time.now)

  admin_user = User.create(:email => 'admin@example.com',
                           :first_name => 'Admin',
                           :last_name => 'User',
                           :company_name => 'Internal',
                           :job_title => 'Admin User',
                           :password => 'password',
                           :password_confirmation => 'password',
                           :active => true,
                           :created_at => Time.now)
  
  staff_user = User.create(:email => 'staff@example.com',
                           :first_name => 'Staff',
                           :last_name => 'User',
                           :company_name => 'Internal',
                           :job_title => 'Staff User',
                           :password => 'password',
                           :password_confirmation => 'password',
                           :active => true,
                           :created_at => Time.now)
  
  user = User.create(      :email => 'user@example.com',        
                           :first_name => 'Standard',           
                           :last_name => 'User',                
                           :company_name => 'Internal',         
                           :job_title => 'Standard User',       
                           :password => 'password',             
                           :password_confirmation => 'password',
                           :active => true,                     
                           :created_at => Time.now)             

  # create dummy quote data
  ios_quote_data = IosValue.create( :daily_rate => "100", 
                                    :iosdevice_install_time => "1", 
                                    :iosdevice_support_cost => "1",
                                    :iosdevice_install_setup => "1",
                                    :created_at => Time.now)
                                  
  mac_quote_data = MacValue.create(:mac_install_time => "0.4",
                                   :server_install_time => "5",
                                   :new_user_setup_time => "0.1",
                                   :ad_integration_time => "1.65",
                                   :deploy_studio_setup_time => "1.5",
                                   :airport_setup_time => "0.25",
                                   :print_server_time => "0.33",
                                   :iwork_time => "0.25",
                                   :office_time => "0.33",
                                   :fce_time => "0.50",
                                   :fcp_time => "0.75",
                                   :ard_time => "0.20",
                                   :logicx_time => "0.50",
                                   :logicp_time => "0.75",
                                   :cs5_time => "0.75",
                                   :aperture_time => "0.20",
                                   :consulting_time => "1.50",
                                   :documentation_time => "4.0",
                                   :halfday_price => " 275",
                                   :day_rate => "550",
                                   :mac_support_cost => "55",
                                   :server_support_cost => "300",
                                   :created_at => Time.now)
