Rails.application.routes.draw do
  root 'chatrooms#index'

  # SESSION
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
end
