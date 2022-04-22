Rails.application.routes.draw do
  get 'daily/index'
  get 'daily/byCustomer'
  get 'daily/byTotal'
  get 'daily/byRangeDate'

  get 'order/', to: 'order#index'
  get 'order/:id/detail', to: 'order#show'
  post 'order/', to: 'order#create'
  put 'order/:id', to: 'order#update'
  patch 'order/:id', to: 'order#update'
  
  resources :items
end
