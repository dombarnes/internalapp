# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

    Role.delete_all
    roles= Role.create([{:id => '1', :name => 'admin'},{:id => '2', :name => 'staff'},{:id => '3', :name => 'reseller'}])
    User.delete_all
    users = []
    users << User.create!(:id => '1', :login => 'admin', :first_name => 'Admin', :last_name => 'User', :email => 'admin@example.com', :role => Role.find_by_id('1'), :password => 'adminpassword123', :password_confirmation => 'adminpassword123')
    user = User.first
    user.active = true
    user.save