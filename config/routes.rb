Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#landing'
  post "/cart", to: "orders#add_cart"
  post "/remove_item", to: "orders#remove_cart"
  put "/clear_cart", to: "orders#clear_cart"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :addresses, except: [:show]
    resources :orders
  end

  resources :items

  resources :pages , only: [] do
    collection do
      get :home, :menu
    end
  end

end
