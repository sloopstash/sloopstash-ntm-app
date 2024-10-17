Rails.application.routes.draw do
  get "dashboard/index"
  get 'dashboard/index'
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  
  resources :notes, only: [:new, :create, :update, :destroy]

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
   
  resource :session, only: [:new, :create, :destroy]
 
  root 'sessions#new'
  get '/signin', to: 'sessions#new' 
  post '/signin', to: 'sessions#create'

  resources :items, only: [:new, :create]
  # Route for signing out
  delete '/logout', to: 'sessions#destroy', as: 'logout'



  resources :users, only: [:new, :create]
  
  get "/users", to: "users#index"  # Route to display all users
  get "/users/:id", to: "users#show"  # Route to display a specific user
  
  resources :notes, only: [:new, :create, :update, :destroy]
  get 'notes/:id/edit', to: 'notes#edit', as: 'edit_note'
  get "/notes", to: "notes#index"
  get "/notes/:id", to: "notes#show"
  post '/createForm', to: 'notes#create', as: 'create_note'

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")

end
