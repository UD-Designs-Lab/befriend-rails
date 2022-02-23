Rails.application.routes.draw do
  defaults format: :json do
    resources :users, only: [:index, :create, :show, :update] do
      resources :favourites, only: [:index]
      member do
        get :following, :followers, :liked_posts, :media_posts, :commented_posts
      end
    end

    resources :sessions, only: [:create, :show]

    resources :relationships, only: [:create, :destroy]

    resources :posts, only: [:index, :show, :create, :update, :destroy] do
      resources :comments, only: [:create, :update], module: :posts
      resources :favourites, only: [:create], module: :posts
      resources :reposts, only: [:create], module: :posts
      member do
        post :vote_like, :vote_thumbs_up, :vote_smile
        get :likers, :thumbed_upers, :smilers
      end
    end

    resources :reposts, only: [:index, :create, :update, :destroy] do
      resources :comments, only: [:create], module: :reposts
      resources :reposts, only: [:create], module: :reposts
      resources :favourites, only: [:create], module: :reposts
      member do
        post :vote_like, :vote_thumbs_up, :vote_smile
        get :likers, :thumbed_upers, :smilers
      end
    end

    resources :comments, only: [:create, :update, :destroy] do
      resources :favourites, only: [:create], module: :comments
      resources :reposts, only: [:create], module: :comments
      member do
        post :vote_like, :vote_thumbs_up, :vote_smile
      end
      resources :comments, only: [:create, :update, :show], module: :comments
    end

    resources :favourites, only: [:destroy]
  end
end
