Rails.application.routes.draw do
  get 'order/', to: 'order#index'
  get 'order/:id/detail', to: 'order#show'
  post 'order/', to: 'order#create'
  put 'order/:id', to: 'order#update'
  patch 'order/:id', to: 'order#update'
  resources :items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
