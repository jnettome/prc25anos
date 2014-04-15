Rails.application.routes.draw do
  resources :orders

  get 'content/home'
  get 'obrigado', to: 'content#return'

  root 'content#home'
end
