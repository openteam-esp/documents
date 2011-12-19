Documents::Application.routes.draw do
  namespace :admin do
    resources :documents
    resources :projects

    root :to => 'documents#index'
  end
end
