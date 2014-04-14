Rails.application.routes.draw do
  get 'content/home'
  get 'obrigado', to: 'content#return'

  root 'content#home'
end
