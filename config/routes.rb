Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  scope "(:locale)", locale: /en|es|pt-BR/ do
    root to: 'pages#home'
    devise_for :users, skip: :omniauth_callbacks
    
    resources :profiles, except: [:delete]

    resources :restaurants, only: [:index, :show]
    
    resources :shelters, only: [:index, :show] do
      get '/map', to: 'shelters#map', as: :map
    end
    
    resources :lawyers, except: [:edit, :update, :destroy], shallow: true do
      resources :reviews, except: [:show]
    end

    resources :schools, only: [:index, :show]
    resources :documents, only: [:index]
    resources :communications, only: [:index, :show]
    resources :chatrooms, only: [:index, :new, :create]

    resources :chatrooms, only: :show do
      resources :messages, only: :create
      post '/add_member', to: 'chatrooms#add_member', as: :add_member
    end
    
    resources :directs, only: [:index, :show]
    resources :chatrooms, only: [:index, :new, :create]
    post ':id/create_direct', to: 'directs#create_direct', as: :create_direct
    get '/maps', to: 'pages#maps', as: :maps
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end

  post '/update_position', to: 'pages#update_position', as: :update_position
  
end
