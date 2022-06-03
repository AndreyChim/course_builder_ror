Rails.application.routes.draw do
  resources :courses do
    resources :units
  end

  root "courses#index"

  get 'units/index'
 
  get "/courses", to: "courses#index"
  get "/units", to: "units#index"
  
  #get "/courses/index"
  
  get "/courses/:id", to: "courses#show"
  get "/units/:id",   to: "units#show"

  get "/courses/:id", to: "courses#index"
  get "/units/:id",   to: "units#index"


  get "/courses/:id", to: "courses#create"
  get "/units/:id",   to: "units#create"


  #get '/courses/:id', to: 'courses#show', as: 'course'


   # resources :units do
   #   resources :courses
  # end
  

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
