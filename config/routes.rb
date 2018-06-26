Rails.application.routes.draw do
  get 'events/index'
  resources :routes
end
