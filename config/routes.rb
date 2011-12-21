Documents::Application.routes.draw do
  namespace :admin do
    resources :documents do
      resources :cancels, :only => [:create, :index]
      resources :changes, :only => [:create, :index]
      resources :assertations, :only => [:create, :index]
    end

    resources :projects

    root :to => 'documents#index'
  end

  resources :documents, :only => [:index, :show]
  resources :projects, :only => [:index, :show]

  root :to => 'documents#index'
end
