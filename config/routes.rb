Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"


  # get 'signup' => 'users#new', as: 'signup'
  get 'login' => 'sessions#new', as: 'login'
  get 'logout' => 'sessions#destroy', as: 'logout'


  resources :events
  resources :users
  resources :sessions, only: [:new, :create]
  resources :enrollments, only: [:create, :destroy, :update]
end
