# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

  super_user = User.create(:login => 'super_user',
                            :email => 'super@example.com',
                           :first_name => 'Super',
                           :last_name => 'User',
                           :company_name => 'Internal',
                           :job_title => 'Super User',
                           :password => 'password',
                           :password_confirmation => 'password',
                           :active => true,
                           :created_at => Time.now)
  admin_user = User.create(:login => 'admin_user',
                           :email => 'admin@example.com',
                           :first_name => 'Admin',
                           :last_name => 'User',
                           :company_name => 'Internal',
                           :job_title => 'Admin User',
                           :password => 'password',
                           :password_confirmation => 'password',
                           :active => true,
                           :created_at => Time.now)
  staff_user = User.create(:login => 'staff_user',
                            :email => 'staff@example.com',
                           :first_name => 'Staff',
                           :last_name => 'User',
                           :company_name => 'Internal',
                           :job_title => 'Staff User',
                           :password => 'password',
                           :password_confirmation => 'password',
                           :active => true,
                           :created_at => Time.now)
  user = User.create(:login => 'user',
                     :email => 'user@example.com',
                     :first_name => 'Standard',
                     :last_name => 'User',
                     :company_name => 'Internal',
                     :job_title => 'Standard User',
                     :password => 'password',
                     :password_confirmation => 'password',
                     :active => true,
                     :created_at => Time.now)
                       
  # create roles
  super_role = Role.create(:name => 'super', :description => 'Super user')
  admin_role = Role.create(:name => 'admin', :description => 'Admin user')
  staff_role = Role.create(:name => 'staff', :description => 'Staff user')
  user_role  = Role.create(:name => 'user', :description => 'Normal user')