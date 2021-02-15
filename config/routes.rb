Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :doses, only: [:new, :create]
  end
end
