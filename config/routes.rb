SuperZapatos::Application.routes.draw do
  resources :articles, only: [:new, :create]
  resources :stores, only: [:new, :create]
  root "static_pages#home"
end
