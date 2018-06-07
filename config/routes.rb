Rails.application.routes.draw do

  get 'welcome/index'

  get 'welcome/index'

  get 'welcome/about'
  
  root 'registered_apps#index'
  
  devise_for :users
  
  resources :registered_apps
  
  # tell API routes to expect JSON requests
  namespace :api, defaults: { format: :json } do
    match '/events/', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end
end
