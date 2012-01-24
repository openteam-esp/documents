class Admin::AssertationCandidatesController < Admin::CandidatesController
  protected
    def search_and_paginate_collection
      @document.assertation_candidates(params[:document_search], paginate_options)
    end
end
