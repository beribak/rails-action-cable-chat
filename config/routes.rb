Rails.application.routes.draw do
  get 'chats/show'
  devise_for :users
  root to: 'pages#home'

  resources :chats, only: [:show] do 
    resources :messages, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
