Documents::Application.routes.draw do
  namespace :admin do
    resources :documents do
      resources :assertations,  :only => [:create, :destroy, :index]
      resources :cancels,       :only => [:create, :destroy, :index]
      resources :changes,       :only => [:create, :destroy, :index]

      resources :cancel_candidates, :only => :index
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
    get :rss, :to => :index, :on => :collection, :defaults => { :format => :rss }

    resources :assertations,  :only => :index
    resources :cancels,       :only => :index
    resources :changes,       :only => :index
  end

  resources :projects,  :only => [:index, :show] do
    get :rss, :to => :index, :on => :collection, :defaults => { :format => :rss }
  end

  resources :papers,    :only => :show

  mount ElVfsClient::Engine => '/'

  root :to => 'documents#index'
end
