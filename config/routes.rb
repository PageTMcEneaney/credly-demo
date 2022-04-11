Rails.application.routes.draw do
  get 'badge_two/index'
  get 'badge_one/index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "users#index"
  get 'users/index'
  resources :users
end
