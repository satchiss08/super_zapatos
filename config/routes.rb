SuperZapatos::Application.routes.draw do
  namespace :services, :defaults => {:format => :json} do
    resources :articles, only: [:index]
    resources :stores, only: [:index]
    match '/articles/stores/:id', to: 'articles#show', via: 'get'
  end
  resources :articles, only: [:new, :create]
  resources :stores, only: [:new, :create]
  root "static_pages#home"
end
