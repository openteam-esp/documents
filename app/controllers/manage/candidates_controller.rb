class Manage::CandidatesController < Manage::ApplicationController
  has_scope :page, :default => 1

  layout false

  def index
    @document = Document.find(params[:document_id])
  end
end
