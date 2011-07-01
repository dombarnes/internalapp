privileges do
  privilege :manage, :includes => [:create, :read, :update, :destroy]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end

authorization do
  role :guest do
    has_permission_on :users, :to => [:new]
    has_permission_on :home, :to => [:read]
  end

  role :standard do
    includes :guest
    has_permission_on :home, :to => [:read]
    has_permission_on :users, :to => [:show, :update, :index] do
      if_attribute :user => is { current_user }
    end
    has_permission_on [:ios_quotes, :mac_quotes], :to => [:index, :create]
    has_permission_on [:ios_quotes, :mac_quotes], :to => [:index, :read, :update] do
      if_attribute :user => is { user }
    end
  end
  
  role :staff do
    includes :standard
    has_permission_on [:companies, :adhoc_supports, :clients, :ios_values, :mac_values, :install_quotes], :to => :manage
  end
  
  role :admin do
    has_omnipotence
#    has_permission_on :all, :to => :manage
    has_permission_on :authorization_rules, :to => :manage
  end
end

