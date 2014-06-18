SuperZapatos::Application.routes.draw do
  namespace :services, :defaults => {:format => :json} do
    resources :articles
    resources :stores
  end
end
