Rails.application.routes.draw do
  root "static_page#index"
  devise_for :users
  namespace :blog do
    resources :users do
      resources :posts
    end
    resources :posts
  end
end
