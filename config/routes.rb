Rails.application.routes.draw do
  get 'lawyers/index'
  get 'lawyers/show'
  devise_for :users
  root to: 'pages#home'
  
  resources :restaurants, only: [:index, :show]
  resources :shelters, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
