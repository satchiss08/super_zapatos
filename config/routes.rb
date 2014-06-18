SuperZapatos::Application.routes.draw do
  namespace :api, :defaults => {:format => :json} do
    resources :article
  end
end
