Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :pets do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:update, :show,:edit] do
    resources :reviews, only: [:new, :create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/dashboard' => 'dashboards#show', as: :dashboard
  # get '/review' => 'reviews#new', as: :review
end
