class InheritedResourcesController < ApplicationController
  inherit_resources

  has_searcher

  respond_to :html, :json

  def index
    index! { |success|
      success.json { render :json => collection.map(&:to_json) }
    }
  end

  def show
    show! { |success|
      success.json { render :json => resource.to_json }
    }
  end

  protected
    def collection
      get_collection_ivar || set_collection_ivar(search_and_paginate_collection)
    end

    def search_and_paginate_collection
      if params[:utf8]
        searcher.pagination = paginate_options
        searcher.results
      else
        end_of_association_chain.page(params[:page]).per(per_page)
      end
    end

    def per_page
      1
    end

    def paginate_options(options={})
      {
        :page       => params[:page],
        :per_page   => per_page
      }.merge(options)
    end
end
