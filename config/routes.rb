Rails.application.routes.draw do
  scope "(:locale)", locale: /en|es|pt-BR/ do
    root to: 'pages#home'
    devise_for :users

    resources :profiles, only: [:show]

    resources :restaurants, only: [:index, :show]
    resources :shelters, only: [:index, :show]

    resources :lawyers, except: [:edit, :update, :destroy]
    resources :schools, only: [:index, :show]
    resources :documents, only: [:index, :show]
    resources :communications, only: [:index, :show]

    get '/maps', to: 'pages#maps', as: :maps
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
