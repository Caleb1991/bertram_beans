Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :coworkers, only: [:index, :new, :create, :destroy]
  resources :beverages, only: [:index, :new, :create, :destroy]
  resources :coworker_beverages, only: [:index, :new, :create]
end
