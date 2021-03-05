Rails.application.routes.draw do
  # devise_for :users, skip: :omniauth_callbacks
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  scope "(:locale)", locale: /en|es|pt-BR/ do
    root to: 'pages#home'
    devise_for :users, skip: :omniauth_callbacks
    
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

  post '/update_position', to: 'pages#update_position', as: :update_position
  
end
