# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

    Role.delete_all
    roles= Role.create([{:name => 'admin'},{:name => 'staff'},{:name => 'reseller'}])
    User.delete_all
    users = []
    users << User.create!(:login => 'admin', :first_name => 'Admin', :last_name => 'User', :email => 'admin@example.com', :role => Role.find_by_name('admin').id, :password => 'adminpassword123', :password_confirmation => 'adminpassword123')
    user = User.first
    user.active = true
    user.save
    RolesUser.delete_all
    firstrole = []
    firstrole << RolesUser.create!(:role_id => Role.find_by_name('admin').id, :user_id => User.find_by_login('admin').id)
    