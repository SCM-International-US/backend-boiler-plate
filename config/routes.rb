Rails.application.routes.draw do
  devise_for :admins
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :items do
      end
    end
  end
  end
  get 'api/status', controller: 'application', action: 'status'
  get 'api/ping', controller: 'application', action: 'ping'
  end