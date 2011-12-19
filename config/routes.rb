Documents::Application.routes.draw do
  namespace :admin do
    resources :documents

    root :to => 'documents#index'
  end
end
