Rails.application.routes.draw do
  root to: "home#index"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :users, only: [:show]
  resources :hunts
  resources :teams

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :clues, only: [:index, :create, :destroy, :update]
    end
  end

end
