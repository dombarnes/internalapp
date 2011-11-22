Internalapp::Application.routes.draw do

  resources :invoices do
    resources :invoice_items
  end
  resources :notes
  resources :contracts
  resource :user, :as => 'account'  
  resources :adhoc_supports
  resources :users
  resources :tasks
  resources :roles
#  resources :admin
  resources :companies do
    resources :people    
  end
  resources :people
  resources :mac_quotes
  resources :mac_values
  resources :ios_quotes
  resources :ios_values
  resources :users, :user_sessions
  resources :password_resets
  
  get "user_sessions/new"
  root :to => "home#index"
  
  get "home/index"
  match '/', :to => 'home#index'
  match 'signup' => 'users#new',              :as => :signup
  match 'login' => 'user_sessions#new',       :as => :login
  match 'logout' => 'user_sessions#destroy',  :as => :logout
  match 'activate(/:activation_code)' => 'users#activate', :as => :activate_account
  match 'send_activation(/:user_id)' => 'users#send_activation', :as => :send_activation
  match '/admin', :to => 'admin#index'
  match '/dashboard', :to => 'home#dashboard'
  match '/adhocsupport', :to => 'adhoc_supports#index'
  match '/people', :to => 'people#index'
  match '/companies', :to => 'companies#index'
  match '/quotes', :to => 'home#quotes'
  match '/help', :to =>'home#help'
  match '/admin/roles', :to => 'admin#roles#index'
  match '/profile', :to => 'users#show'
  
end
