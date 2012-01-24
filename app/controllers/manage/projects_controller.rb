class Manage::ProjectsController < Manage::ApplicationController
  custom_actions :resource => [:to_actual, :to_deflected]

  has_scope :page, :default => 1, :only => :index

  has_scope :by_state, :only => :index

  def index
    index! {
      @association = params[:association]
      @subject = Document.find(params[:subject_id]) if params[:subject_id]
    }
  end

  def to_actual
    to_actual! {
      @project.to_actual

      redirect_to resource_path and return
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
