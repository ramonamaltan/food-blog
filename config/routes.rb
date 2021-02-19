Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  resources :recipes do
    resources :favorite_recipes, only: [:new, :create]
    resources :doses, only: [:new, :create, :destroy]
  end
end
