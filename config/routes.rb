Documents::Application.routes.draw do
  namespace :admin do
    resources :documents
    resources :papers, :only => :index
    resources :projects

    root :to => 'documents#index'
  end
end
