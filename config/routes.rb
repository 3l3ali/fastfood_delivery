Rails.application.routes.draw do
  get 'orders/index'

  get 'orders/show'

  get 'orders/new'

  get 'orders/create'

  get 'orders/edit'

  get 'orders/update'

  get 'orders/destroy'

  get 'items/index'

  get 'items/show'

  get 'items/new'

  get 'items/create'

  get 'items/edit'

  get 'items/update'

  get 'items/destroy'

  devise_for :users
  root to: 'pages#landing'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :addresses, :orders
  end

  resources :items

end
