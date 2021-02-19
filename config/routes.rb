Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  resources :favorite_recipes, only: [:index]
  resources :recipes do
    resources :favorite_recipes, only: [:create]
    resources :doses, only: [:new, :create, :destroy]
  end
end
