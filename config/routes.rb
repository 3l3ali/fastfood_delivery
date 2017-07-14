Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#landing'
  post "/cart", to: "orders#add_cart"
  post "/remove_item", to: "orders#remove_cart"
  put "/clear_cart", to: "orders#clear_cart"
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
<<<<<<< HEAD
      get :home, :menu, :dashboard, :orders
=======
      get :home, :menu, :dashboard, :statistics
>>>>>>> af62e2a49d28f81bdd4d6108503b8cae3ddc7889
    end
  end

end
