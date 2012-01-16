class InheritedResourcesController < ApplicationController
  inherit_resources

  has_searcher

  respond_to :html, :json, :rss

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
      params[:utf8] ? search_results : results
    end

    def results
      end_of_association_chain.page(params[:page]).per(per_page)
    end

    def search_results
      searcher.pagination = paginate_options

      results = searcher.results

      headers['X-Current-Page'] = results.current_page.to_s
      headers['X-Total-Pages'] = results.total_pages.to_s

      results
    end

    def per_page
      params[:per_page] || 20
    end

    def paginate_options(options={})
      {
        :page       => params[:page],
        :per_page   => per_page
      }.merge(options)
    end
end
