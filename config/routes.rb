Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/pages/friends", to: "pages#friends"
  get "/groups/:id/join", to: "group#join"
  resources :groups, only: [:new, :index, :show, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
