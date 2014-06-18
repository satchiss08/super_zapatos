SuperZapatos::Application.routes.draw do
  resources :articles
  root "static_pages#home"
  match '/article', to: 'articles#new', via: 'get'
end
