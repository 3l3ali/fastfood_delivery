Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'


  post "/cart", to: "orders#add_cart"
  post "/remove_item", to: "orders#remove_cart"
  put "/clear_cart", to: "orders#clear_cart"

  get '/manager/orders', to: "orders#manager_orders"
  patch '/manager/orders/prepare/:id', to: "orders#to_prepare", as: "prepare"
  patch '/manager/orders/done/:id', to: "orders#to_done", as: "done"
  patch '/manager/orders/out/:id', to: "orders#to_out", as: "out"
  patch '/manager/orders/delivered/:id', to: "orders#to_delivered", as: "delivered"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, except: [:create, :update] do
    resources :addresses, except: [:show]
    resources :orders
  end

  namespace :manager do
    resources :users, only: [:create, :update]
  end

  resources :items

  resources :pages , only: [] do
    collection do
      get :home, :menu, :dashboard, :statistics, :edit_menu
    end
  end

end
