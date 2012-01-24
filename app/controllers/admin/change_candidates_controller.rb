class Admin::ChangeCandidatesController < Admin::ApplicationController
  has_scope :page, :default => 1

  layout false

  def index
    @document = Document.find(params[:document_id])
  end

  protected
    def search_and_paginate_collection
      @document.change_candidates(params[:document_search], paginate_options)
    end
end
