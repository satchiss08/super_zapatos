SuperZapatos::Application.routes.draw do
  namespace :services, :defaults => {:format => :json} do
    resources :articles
    resources :stores
  end
  resources :articles, only: [:new, :create]
  resources :stores, only: [:new, :create]
  root "static_pages#home"
end
