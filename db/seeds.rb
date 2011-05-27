# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

  Role.delete_all

  super_user = User.create(:login => 'super_user',
                            :email => 'super@example.com',
                           :firstname => 'Super',
                           :last_name => 'User',
                           :password => 'password',
                           :password_confirmation => 'password',
                           :active => true,
                           :created_at => Time.now)
  admin_user = User.create(:login => 'admin_user',
                           :email => 'admin@example.com',
                           :firstname => 'Admin',
                           :last_name => 'User',
                           :password => 'password',
                           :password_confirmation => 'password',
                           :active => true,
                           :created_at => Time.now)
  staff_user = User.create(:login => 'staff_user',
                            :email => 'staff@example.com',
                           :firstname => 'Staff',
                           :last_name => 'User',
                           :password => 'password',
                           :password_confirmation => 'password',
                           :active => true,
                           :created_at => Time.now)
  user = User.create(:login => 'user',
                     :email => 'user@example.com',
                     :firstname => 'User',
                     :surname => 'User',
                     :password => 'password',
                     :password_confirmation => 'password',
                     :active => true,
                     :created_at => Time.now)
                       
  # create roles
  super_role = Role.create(:name => 'super', :description => 'Super user')
  admin_role = Role.create(:name => 'admin', :description => 'Admin user')
  staff_role = Role.create(:name => 'staff', :description => 'Staff user')
  user_role  = Role.create(:name => 'user', :description => 'Normal user')

