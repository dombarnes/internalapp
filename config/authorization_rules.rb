authorization do

  role :guest do
    has_permission_on :users, :to => [:create, :new, :activate, :index, :show]
#    has_permission_on :home, :to => [:read]
  end

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
  privilege :manage, :includes => [:create, :read, :update, :destroy]
  privilege :create, :includes => :new
  privilege :read, :includes => [:index, :show]
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end
