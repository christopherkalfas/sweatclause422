Rails.application.routes.draw do
  get 'password_resets/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  get '/users/:id/trackers', to: 'users#trackers'
  get "/profile", to: "users#show"
  get "/updatereps", to: "trackers#edit"
  get "/new/amount/challenges/:id/charities/:id/groups/:id/users/:id", to: "pledges#new"
  post "/charitypledge", to: "pledges#create"

  resources :users 
  resources :groups
  resources :challenges 
  resources :trackers
  resources :charities
  resources :password_resets
  resources :memberships
  resources :pledges
end
