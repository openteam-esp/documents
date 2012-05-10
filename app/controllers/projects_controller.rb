class ProjectsController < InheritedResourcesController
  actions :index, :show

  has_scope :by_state, :default => 'actual'

  has_scope :page, :default => 1, :only => :index

  protected
    def resource
      @project ||= params[:context_ids] ? Project.where(:context_id => params[:context_ids]).find(params[:id]) : super
    end
end
