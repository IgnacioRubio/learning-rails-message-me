Rails.application.routes.draw do
  root 'chatrooms#index'

  # SESSION
  get 'login', to: 'sessions#login'
end
