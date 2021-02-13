Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :recipes, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
  end
end
