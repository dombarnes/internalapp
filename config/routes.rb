Internalapp::Application.routes.draw do

  resources :notes
  resources :contracts
  resource :user, :as => 'account'
  resources :adhoc_supports
  # resources :users
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

  get 'user_sessions/new'
  root to: 'home#index'

  get   'signup' => 'users#new'
  get   'login' => 'user_sessions#new' 
  post  'login' => 'user_sessions#create'
  get   'logout' => 'user_sessions#destroy'

  match 'activate(/:activation_code)' => 'users#activate', :as => :activate_account, via: :get
  match 'send_activation(/:user_id)' => 'users#send_activation', :as => :send_activation, via: :get
  get 'admin' => 'admin#index'
  get 'dashboard' => 'home#dashboard'
  get 'help' =>'home#help'
  get 'profile' => 'users#show'

end
