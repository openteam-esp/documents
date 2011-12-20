class Admin::PapersController < Admin::ApplicationController
  actions :index

  has_scope :page, :default => 1, :only => :index

  has_searcher

  protected
    def collection
      get_collection_ivar || set_collection_ivar(search_and_paginate_collection)
    end

    def search_and_paginate_collection
      if params[:utf8]
        searcher.pagination = paginate_options
        searcher.results
      else
        end_of_association_chain
      end
    end

    def paginate_options(options={})
      {
        :page       => params[:page],
        :per_page   => 10
      }.merge(options)
    end

end
