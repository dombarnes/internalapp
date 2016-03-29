namespace :roles do
  desc 'Creates a role'
  task :create, [:role_name] => :environment do |cmd, args|
    Role.create :name=>args[:role_name]
    puts "Created role #{args[:role_name]}"
  end

  desc 'Add User to Role'
  task :add_user, [:email, :role_name] => :environment do |cmd, args|
    user = User.find_by email: args[:email]
    role = Role.find_by title: args[:role_name]
    unless user
      puts "No such user #{args[:email]}"
      return
    end
    unless role
      puts "No such role #{args[:role_name]}"
      return
    end
    user.roles.push role
    puts "added #{role.title} to #{user.last_name}, #{user.first_name}"
  end
end
