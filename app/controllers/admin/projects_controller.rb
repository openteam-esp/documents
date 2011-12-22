class Admin::ProjectsController < Admin::ApplicationController
  custom_actions :resource => [:to_actual, :to_deflected]

  has_scope :page, :default => 1, :only => :index

  def index
    index! {
      @association = params[:association]
      @subject = Document.find(params[:subject_id]) if params[:subject_id]
    }
  end
end
