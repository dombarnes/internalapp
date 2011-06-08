authorization do
  role :guest do

  end

  role :standard do
    includes :guest
    has_permission_on :users, :to => [:show, :update]
    has_permission_on [:ios_quotes, :mac_quotes], :to => [:create]
    has_permission_on [:ios_quotes, :mac_quotes], :to => [:read, :update] do
      if_attribute :user => is { user }
    end
  end
  
  role :staff do
    includes :standard
    has_permission_on [:companies, :adhoc_supports, :clients, :ios_values, :mac_values, :install_quotes], :to => :manage
  end
  
  role :admin do
    has_omnipotence
    has_permission_on :authorization_rules, :to => :read
  end
end

privileges do
  privilege :manage, :includes => [:create, :read, :update, :destroy]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end