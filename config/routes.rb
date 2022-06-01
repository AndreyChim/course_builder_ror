Rails.application.routes.draw do
  get 'units/index'
  root "courses#index"
  get "/courses", to: "courses#index"
  get "/units", to: "units#index"
  
  #get "/courses/index"
  
  get "/courses/:id", to: "courses#show"

  resources :courses do
    resources :units
  end
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
