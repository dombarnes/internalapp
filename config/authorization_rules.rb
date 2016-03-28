authorization do
  role :guest do
    has_omnipotence
    has_permission_on :users, :to => [:create, :new, :activate, :index, :show]
    # add permissions for guests here, e.g.
    # has_permission_on :conferences, :to => :read
  end
  
  # permissions on other roles, such as
  # role :admin do
  #   has_permission_on :conferences, :to => :manage
  # end
  # role :user do
  #   has_permission_on :conferences, :to => [:read, :create]
  #   has_permission_on :conferences, :to => [:update, :delete] do
  #     if_attribute :user_id => is {user.id}
  #   end
  # end
  # See the readme or GitHub for more examples
  
  role :reseller do
    includes :guest
    has_permission_on :users, :to => [:show, :update] do
      if_attribute :user => is { current_user }
    end
    has_permission_on [:ios_quotes, :mac_quotes], :to => [:create, :read]
    has_permission_on [:ios_quotes, :mac_quotes], :to => [:create, :read, :update] do
      if_attribute :user => is { user }
    end
  end
  
  role :staff do
    includes :reseller
    has_permission_on [:companies, :adhoc_supports, :clients, :ios_values, :mac_values, :install_quotes], :to => :manage
  end
  
  role :admin do
    has_omnipotence
    has_permission_on :authorization_rules, :to => :read
  end
end

privileges do
  # default privilege hierarchies to facilitate RESTful Rails apps
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end
