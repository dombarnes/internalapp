Internalapp::Application.routes.draw do

  root 'home#index'
  # get 'user_sessions/new'
  get 'signup', to: 'users#new'
  get 'login', to: 'user_sessions#new' 
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'
  get 'activate(/:activation_code)', to: 'activations#activate', :as => :activate_account
  get 'send_activation(/:user_id)', to: 'users#send_activation', :as => :send_activation
  get 'admin', to: 'admin#index'
  get 'dashboard', to: 'home#dashboard'
  get 'help', to:'home#help'
  get 'profile', to: 'users#profile', as: 'profile'

  resources :users
  resource :password_resets, only: [:new, :create, :edit, :update]
  resources :notes
  resources :contracts
  resource :user, :as => 'account'
  resources :adhoc_supports
  resources :companies do
    resources :people
  end
  resources :people
  namespace :admin do
    resources :mac_values
    resources :ios_values
    resources :roles
  end
  resources :mac_quotes
  resources :ios_quotes
  resources :user_sessions, only: [:create, :new, :destroy]  
end
