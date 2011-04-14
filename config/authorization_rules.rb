authorization do
  
  role :Admin do
    has_permission_on [:companies, :adhoc_supports, :clients, :ios_quotes, :mac_quotes, :ios_values, :mac_values, :install_quotes, :users], :to => [:index, :show, :edit, :update, :destroy, :create, :new]
  end
  
  role :Staff do
    includes :reseller
    has_permission_on [:companies, :adhoc_supports, :clients, :ios_values, :mac_values, :install_quotes], :to => [:index, :show, :edit, :update, :destroy, :create, :new]
  end
  
  role :Reseller do
    has_permission_on [:ios_quotes, :mac_quotes, :install_quotes], :to => [:index, :show, :edit, :update, :destroy, :create, :new] do
      if_attribute :user => is { user }
    end
  end 
end