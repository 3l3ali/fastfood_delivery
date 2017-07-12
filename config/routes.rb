Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#landing'
  get "/home", to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :addresses, except: [:show]
    resources :orders
  end

  resources :items
  resources :locations, only: [:index]
end
