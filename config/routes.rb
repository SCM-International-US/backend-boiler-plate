Rails.application.routes.draw do
  get 'api/status', controller: 'application', action: 'status'
  get 'api/ping', controller: 'application', action: 'ping'
end