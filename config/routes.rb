Rails.application.routes.draw do
  get 'api/status', controller: 'application', action: 'status'
  get 'api/currencies', controller: 'currencies', action: 'index'
  get 'api/refresh', controller: 'currencies', action: 'refresh'
end