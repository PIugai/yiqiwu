Rails.application.routes.draw do
  root to: 'pages#home'
  post '/login', to: 'login#login'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events, only: [:index, :show, :create]
      # users:show includes bookings
      resources :users, only: [:show, :create, :update] do
        resources :bookings, only: [:create]
      end
      resources :bookings, only: [:update]
    end
  end
end
