Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "signup", to: "sessions#sign_up"
      post "signin", to: "sessions#sign_in"
      resources :users do
        resources :bookings
        resources :items
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
