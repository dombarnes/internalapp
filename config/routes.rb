Internalapp::Application.routes.draw do

  resources :notes
  resources :contracts
  resource :user, :as => 'account'
  resources :adhoc_supports
  resources :users
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
  root 'home#index'

  match 'signup' => 'users#new',              :as => :signup, via: :get
  match 'login' => 'user_sessions#new',       :as => :login, via: :get
  match 'logout' => 'user_sessions#destroy',  :as => :logout, via: :get
  match 'activate(/:activation_code)' => 'users#activate', :as => :activate_account, via: :get
  match 'send_activation(/:user_id)' => 'users#send_activation', :as => :send_activation, via: :get
  match '/admin', :to => 'admin#index', via: :get
  match '/dashboard', :to => 'home#dashboard', via: :get
  match '/adhocsupport', :to => 'adhoc_supports#index', via: :get
  match '/people', :to => 'people#index', via: :get
  match '/companies', :to => 'companies#index', via: :get
  match '/quotes', :to => 'home#quotes', via: :get
  match '/help', :to =>'home#help', via: :get
  match '/admin/roles', :to => 'admin#roles#index', via: :get
  match '/profile', :to => 'users#show', via: :get

end
