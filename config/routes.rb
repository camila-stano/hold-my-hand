Rails.application.routes.draw do
  scope "/:locale" do
    get 'documents/index'
    get 'documents/show'
    devise_for :users
    root to: 'pages#home'
    
    resources :restaurants, only: [:index, :show]
    resources :shelters, only: [:index, :show]

    resources :lawyers, only: [:index, :show]
    resources :schools, only: [:index, :show]
    resources :documents, only: [:index, :show]
    resources :communications, only: [:index, :show]

    get '/maps', to: 'pages#maps', as: :maps
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
