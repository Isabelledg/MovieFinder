Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/pages/friends", to: "pages#friends"

  resources :groups, only: %i[new index show create] do
    resources :movies, only: [:index]

    resources :user_groups, only: %i[new create show] do
      resources :user_movies, only: %i[create show]
    end
  end

  get "/groups/:id/results", to: "groups#results",  as: "results"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
