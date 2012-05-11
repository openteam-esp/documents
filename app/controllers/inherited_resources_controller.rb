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
      end_of_association_chain.page(page).per(per_page)
    end

    def search_results
      searcher.pagination = paginate_options

      results = searcher.results

      headers['X-Total-Count'] = results.total_count.to_s
      headers['X-Current-Page'] = results.current_page.to_s
      headers['X-Total-Pages'] = results.total_pages.to_s

      results
    end

    def page
      params[:page].blank? ? 1 : params[:page].to_i
    end

    def per_page
      params[:per_page].to_i.zero? ? 20 : params[:per_page].to_i
    end

    def paginate_options
      {
        :page       => page,
        :per_page   => per_page
      }
    end
end
