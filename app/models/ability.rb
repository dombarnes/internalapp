class Ability
  include CanCan::Ability
  
  def initialize(user)
    self.clear_aliased_actions
    
    alias_action :index, :show, :to => :read
    alias_action :new,          :to => :create
    alias_action :edit,         :to => :update
    alias_action :destroy,      :to => :delete

  user ||= User.new # guest user

    # super user can do everything
          if user.role? :super_user
            can :manage, :all
          else
            # edit update self
            can :read, User do |resource|
              resource == user
            end
            can :update, User do |resource|
              resource == user
            end
            # enables signup
            can :create, User

            user.roles.each do |role|
              if role.permissions
                role.permissions.each do |perm_name|
                  unless Ability.permissions[perm_name].nil?
                    can(Ability.permissions[perm_name]['action'].to_sym, Ability.permissions[perm_name]['subject_class'].constantize) do |subject|
                      Ability.permissions[perm_name]['subject_id'].nil? ||
                        Ability.permissions[perm_name]['subject_id'] == subject.id
                    end
                  end
                end
              end
            end
          end  
  
  def self.permissions
    @@permissions ||= Ability.load_permissions
  end

  def self.load_permissions(file='permissions.yml')
    YAML.load_file("#{::Rails.root.to_s}/config/#{file}")
  end
end