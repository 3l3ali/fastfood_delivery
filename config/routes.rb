Rails.application.routes.draw do


  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get "/home", to: "pages#home"
  root to: 'pages#landing'
  post "/cart", to: "orders#add_cart"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :addresses, except: [:show]
    resources :orders
  end

  resources :items
  resources :locations, only: [:index]
end
