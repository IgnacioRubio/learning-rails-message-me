Rails.application.routes.draw do
  root 'chatrooms#index'

  # SESSION
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # MESSAGES
  post 'message', to: 'messages#create'

  # CHANNEL
  mount ActionCable.server, at: '/cable'
end
