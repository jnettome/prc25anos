Rails.application.routes.draw do
  resources :orders
  post 'orders/notify'

  get 'content/home'
  get 'obrigado', to: 'content#return'
  get 'panel/:code', to: 'content#panel'

  root 'content#home'
end
