Rails.application.routes.draw do
  get 'order/', to: 'order#index'
  get 'order/show'
  get 'order/create'
  get 'order/update'
  resources :items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
