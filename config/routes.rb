Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/pages/friends", to: "pages#friends"

  resources :groups, only: [:new, :index, :show, :create] do
    member do
      post :join #/groups/:id/join
    end
    resources :user_genres, only: [:index] do
      resources :user_movies, only: [:index]
    end
    resources :user_groups, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
