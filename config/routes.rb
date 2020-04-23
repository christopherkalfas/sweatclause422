Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destory'
  
  get '/users/:id/trackers', to: 'users#trackers'
  resources :users
  resources :groups
  resources :challenges
  resources :trackers
end
