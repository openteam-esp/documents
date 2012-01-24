class Manage::ChangeCandidatesController < Manage::CandidatesController
  protected
    def search_and_paginate_collection
      @document.change_candidates(params[:document_search], paginate_options)
    end
end
