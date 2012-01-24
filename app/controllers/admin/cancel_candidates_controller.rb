class Admin::CancelCandidatesController < Admin::CandidatesController
  protected
    def search_and_paginate_collection
      @document.cancel_candidates(params[:document_search], paginate_options)
    end
end
