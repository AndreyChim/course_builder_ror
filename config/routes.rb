Rails.application.routes.draw do
  

  root "courses#index"
  
  # get "/units", to: "units#index"
  
  # post "/units", to: "units#create"
  
  
  
  # post  "/courses/:id/units", to: "units#create"
  # post  "/courses/:id/units/new", to: "units#create"
  # post  "/courses/:id/units/new", to: "units#new"
  # post  "/units/:id", to: "units#create"

  resources :courses do
      resources :units
  end
end
