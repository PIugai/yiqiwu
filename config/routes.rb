Rails.application.routes.draw do
  root to: 'pages#home'
  post '/login', to: 'login#login'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :events, only: [:index, :show, :new, :create]
      resources :users, only: [:show, :new, :create, :edit, :update]
      resources :bookings, only: [:index, :show, :new, :create, :edit, :update]
    end
  end
end
