Documents::Application.routes.draw do
  namespace :admin do
    resources :documents do
      resources :assertations,  :only => [:create, :destroy, :index]
      resources :cancels,       :only => [:create, :destroy, :index]
      resources :changes,       :only => [:create, :destroy, :index]
    end

    resources :projects do
      %w[actual asserted deflected].each do |state|
        get state, :action => :index, :on => :collection, :defaults => { :by_state => state }
      end

      member do
        put :to_actual
        put :to_deflected
      end
    end

    root :to => 'documents#index'
  end

  resources :documents, :only => [:index, :show] do
      resources :assertations,  :only => :index
      resources :cancels,       :only => :index
      resources :changes,       :only => :index
  end

  resources :projects, :only => [:index, :show]

  mount ElVfsClient::Engine => '/'

  root :to => 'documents#index'
end
