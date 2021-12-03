Rails.application.routes.draw do
  root "users#index"
  
  resources :users
  get "users/typehead/:query", to: "users#query"
end
