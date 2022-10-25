Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :transactions, only: [:index, :show, :create, :update]
      resources :customers, only: [:index]
      resources :users, param: :_username
      post '/auth/login', to: 'authentication#authenticate'
      get '/*a', to: 'application#not_found'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
