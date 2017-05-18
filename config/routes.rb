Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root "static_page#index"
  devise_for :users
  resources :users do
    resources :posts
  end
  resources :posts
end
