Rails.application.routes.draw do
  root to: 'pages#home'
  post '/login', to: 'login#login'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events, only: [:index, :show, :create]
      resources :users, only: [:show, :create, :update]
      resources :bookings, only: [:index, :create, :update]
    end
  end
end
