Rails.application.routes.draw do
  

  root "courses#index"

  # get "/courses", to: "courses#index"
  get "/units", to: "units#index"
  
  # get "/units", to: "units#new"
   
  # rout for create  new unit
  post "/units", to: "units#create"
  
  
  
  # patch '/courses/:id/edit', to: 'courses#edit'

  # patch "/courses/:id", to: "courses#show"
  # post  "/courses/:id", to: "courses#edit"
  # put  "/courses/:id/edit", to: "courses#edit"
  
  # get 'courses/:id/edit', to: 'courses#edit', as: 'edit_course' # edit
  # patch 'courses/:id', to: 'courses#update' # update (as needed)
  # put 'courses/:id', to: 'courses#update' # update (full replacement)

  post  "/courses/:id/units", to: "units#create"
  post  "/courses/:id/units/new", to: "units#create"
  post  "/courses/:id/units/new", to: "units#new"
  post  "/units/:id", to: "units#create"

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
