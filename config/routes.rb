Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      post "signup", to: "sessions#sign_up"
      post "signin", to: "sessions#sign_in"
      resources :bookings, only: [:show, :create, :destroy]
      post "bookings/user", to: "bookings#user"
      resources :items, only: [:index, :show, :create, :destroy]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
