Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  scope "(:locale)", locale: /en|es|pt-BR/ do
    root to: 'pages#home'
    devise_for :users, skip: :omniauth_callbacks
    
    resources :profiles, only: [:show, :new, :create]
    resources :profiles_about, only: [:new, :create]

    resources :restaurants, only: [:index, :show]
    
    resources :shelters, only: [:index, :show] do
      get '/map', to: 'shelters#map', as: :map
    end
    
    resources :lawyers, except: [:edit, :update, :destroy], shallow: true do
      resources :reviews, except: [:show]
    end

    resources :schools, only: [:index, :show]
    resources :documents, only: [:index, :show]
    resources :communications, only: [:index, :show]
    resources :chatrooms, only: [:index, :new, :create]

    resources :chatrooms, only: :show do
      resources :messages, only: :create
    end
    
    resources :directs, only: :show
    resources :chatrooms, only: [:index, :new, :create]
    
    get '/maps', to: 'pages#maps', as: :maps
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end

  post '/update_position', to: 'pages#update_position', as: :update_position
  
end
