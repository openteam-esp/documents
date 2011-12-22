Documents::Application.routes.draw do
  namespace :admin do
    resources :documents
    resources :projects

    root :to => 'documents#index'
  end

  resources :documents, :only => [:index, :show]
  resources :projects, :only => [:index, :show]

  root :to => 'documents#index'
end
