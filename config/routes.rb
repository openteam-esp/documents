Documents::Application.routes.draw do
  namespace :manage do
    resources :users, :only => :index do
      resources :permissions, :only => [:new, :create, :destroy]
    end

    resources :documents do
      #resources :assertations,  :only => [:create, :destroy, :index]
      #resources :cancels,       :only => [:create, :destroy, :index]
      #resources :changes,       :only => [:create, :destroy, :index]

      #resources :assertation_candidates,  :only => :index
      #resources :cancel_candidates,       :only => :index
      #resources :change_candidates,       :only => :index
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

    match '/context/get_categories', :to => 'contexts#get_categories'

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
