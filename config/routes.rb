Internalapp::Application.routes.draw do

  root 'home#index'
  get 'user_sessions/new'
  get 'signup' => 'users#new'
  get 'login' => 'user_sessions#new' 
  post 'login' => 'user_sessions#create'
  get 'logout' => 'user_sessions#destroy'
  get 'activate(/:activation_code)' => 'users#activate', :as => :activate_account
  get 'send_activation(/:user_id)' => 'users#send_activation', :as => :send_activation
  get 'admin' => 'admin#index'
  get 'dashboard' => 'home#dashboard'
  get 'help' =>'home#help'
  get 'profile' => 'users#show'

  resources :notes
  resources :contracts
  resource :user, :as => 'account'
  resources :adhoc_supports
  resources :companies do
    resources :people
  end
  resources :people
  resources :mac_quotes
  resources :mac_values
  resources :ios_quotes
  resources :ios_values
  resources :user_sessions, only: [:create, :new, :destroy]  
  resources :users
  resources :password_resets, only: [:new, :create, :edit, :update]
end
