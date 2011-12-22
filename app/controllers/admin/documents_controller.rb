class Admin::DocumentsController < Admin::ApplicationController
  has_scope :page, :default => 1, :only => :index

  def index
    index! {
      @association = params[:association]
      @subject = Document.find(params[:subject_id]) if params[:subject_id]
    }
  end
end
