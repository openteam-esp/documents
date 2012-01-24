class Manage::CancelCandidatesController < Manage::CandidatesController
  protected
    def search_and_paginate_collection
      @document.cancel_candidates(params[:document_search], paginate_options, current_user)
    end
end
