class Manage::AssertationCandidatesController < Manage::CandidatesController
  protected
    def search_and_paginate_collection
      @document.assertation_candidates(params[:document_search], paginate_options, current_user)
    end
end
