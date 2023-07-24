Rails.application.routes.draw do
  resources :vacants

  get '/postulations', to: 'postulations#index' 
  
  post '/postulations', to: 'postulations#create'

  get '/admins/new', to: 'admins#new', as: :new_user

  post '/admins', to: 'admins#create', as: :user_created

    
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "vacants#index"
end
