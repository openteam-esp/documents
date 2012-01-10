Documents::Application.routes.draw do
  namespace :admin do
    resources :documents do
      resources :cancels, :only => [:create, :index]
      resources :changes, :only => [:create, :index]
      resources :assertations, :only => [:create, :index]
    end

    resources :projects do
      %w[actual asserted deflected].each do |state|
        get state, :action => :index, :on => :collection, :defaults => { :by_state => state }
      end

      member do
        put :to_actual
        put :to_deflected
      end

      root :to => :index, :defaults => { :by_state => 'actual' }
    end

    root :to => 'documents#index'
  end

  resources :documents, :only => [:index, :show] do
      resources :cancels, :only => [:index]
      resources :changes, :only => [:index]
      resources :assertations, :only => [:index]
  end

  resources :projects, :only => [:index, :show]

  mount ElVfsClient::Engine => '/'

  root :to => 'documents#index'
end
