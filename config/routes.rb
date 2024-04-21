Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :coworkers, only: [:new, :create]
  resources :beverages, only: [:new, :create]
end
