Rails.application.routes.draw do
  resources :categories, only: %i[new create show]
  resources :articles, only: %i[index show new create]
  resources :users, only: %i[new index create]
  root 'users#new'
  post '/users/logout', to: 'users#logout'
  get '/votes/vote_up/:id', to: 'votes#vote_up'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
