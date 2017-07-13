Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#landing'

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
      get :home, :menu
    end
  end

end
