Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :restaurants, only: [:index, :show]
  resources :shelters, only: [:index, :show]
  resources :lawyers, only: [:index, :def show
    @ = .find()
  end
  ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
