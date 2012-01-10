class Admin::ProjectsController < Admin::ApplicationController
  custom_actions :resource => [:to_actual, :to_deflected]

  has_scope :page, :default => 1, :only => :index

  def index
    index! {
      @association = params[:association]
      @subject = Document.find(params[:subject_id]) if params[:subject_id]
    }
  end

  def to_deflected
    to_deflected! {
      @project.attributes = params[:project]

      if @project.to_deflected
        redirect_to resource_path and return
      else
        render :show and return
      end

    }
  end
end
