authorization do
  
  role :admin do
    has_permission_on [:companies, :adhoc_supports, :clients, :ios_quotes, :mac_quotes, :ios_values, :mac_values, :install_quotes, :users], :to => [:index, :show, :edit, :update, :destroy, :create, :new]
  end
  
  role :staff do
    includes :reseller
    has_permission_on [:companies, :adhoc_supports, :clients, :ios_values, :mac_values, :install_quotes], :to => [:index, :show, :edit, :update, :destroy, :create, :new]
  end
  
  role :reseller do
    has_permission_on [:ios_quotes, :mac_quotes, :install_quotes], :to => [:index, :show, :edit, :update, :destroy, :create, :new] do
      if_attribute :user => is { user }
    end
  end 
end

privileges do

privilege :manage, :includes => [:create, :read, :update, :delete]
privilege :read, :includes => [:index, :show]
privilege :create, :includes => :new
privilege :update, :includes => :edit
privilege :delete, :includes => :destroy
end