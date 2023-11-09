Rails.application.routes.draw do

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories
  resources :brands
  resources :blueprints
  resources :expansions
  resources :properties

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "pages#home"

  get  "dash_user" =>'dashboard#user'
  get  "dash_admin" =>'dashboard#admin'
  get  "dash_superadmin" =>'dashboard#superadmin'
  get  "dashboard" => 'dashboard#index'

  # dashboard pages
  get "user_orders" => 'pages#user_orders'
  get "admin_section" => 'pages#admin_section'
  get "super_section" => 'pages#super_section'



end
