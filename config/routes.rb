Rails.application.routes.draw do
  resources :orders
  post 'orders/notify'

  get 'content/home'
  get 'obrigado', to: 'content#return'

  root 'content#home'
end
