Documents::Application.routes.draw do
  namespace :admin do
    resources :documents do
      resources :cancels, :only => :index
      resources :changes, :only => :index
      resources :assertations, :only => :index
    end

    resources :projects

    root :to => 'documents#index'
  end

  resources :documents, :only => [:index, :show]
  resources :projects, :only => [:index, :show]

  root :to => 'documents#index'
end
