Documents::Application.routes.draw do
  mount ElVfsClient::Engine => '/'

  namespace :manage do
    mount EspPermissions::Engine => 'permissions'

    resources :documents do
      resources :assertations,  :only => [:create, :destroy, :index]
      resources :cancels,       :only => [:create, :destroy, :index]
      resources :changes,       :only => [:create, :destroy, :index]

      resources :assertation_candidates,  :only => :index
      resources :cancel_candidates,       :only => :index
      resources :change_candidates,       :only => :index
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

  resources :contexts, :only => :index, :defaults => { :format => :json }

  resources :documents, :only => [:index, :show] do
    resources :assertations,  :only => :index
    resources :cancels,       :only => :index
    resources :changes,       :only => :index
  end

  resources :papers,    :only => :show
  resources :projects,  :only => [:index, :show]

  root :to => 'documents#index'
end
