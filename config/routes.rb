Rails.application.routes.draw do
  

  root "courses#index"

  # get 'units/index'
 
  get "/courses", to: "courses#index"
  get "/units", to: "units#index"
  
  
  patch '/courses/:id/edit', to: 'courses#edit'
  
  # #get "/courses/index"
  
  # get "/courses/:id", to: "courses#show"
  # get "/units/:id",   to: "units#show"

  patch "/courses/:id", to: "courses#show"
  post  "/courses/:id", to: "courses#edit"
  put  "/courses/:id/edit", to: "courses#edit"
  
  get 'courses/:id/edit', to: 'courses#edit', as: 'edit_course' # edit
  patch 'courses/:id', to: 'courses#update' # update (as needed)
  put 'courses/:id', to: 'courses#update' # update (full replacement)
  

  # get "/courses/:id", to: "courses#index"
  # get "/units/:id",   to: "units#index"


  # get "/courses/:id", to: "courses#create"
  # get "/units/:id",   to: "units#create"


  #get '/courses/:id', to: 'courses#show', as: 'course'

  resources :courses do
      resources :units
  end
  
  # resources :units do
  #     resources :courses
  #  end
  

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
