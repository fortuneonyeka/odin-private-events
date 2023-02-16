Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
  resources :events
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :enrollments, only: [:create, :destroy, :update]
end
