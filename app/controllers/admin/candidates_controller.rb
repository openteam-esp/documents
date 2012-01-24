class Admin::CandidatesController < Admin::ApplicationController
  has_scope :page, :default => 1

  layout false

  def index
    @document = Document.find(params[:document_id])
  end
end
