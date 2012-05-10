class DocumentsController < InheritedResourcesController
  actions :index, :show

  has_scope :page, :default => 1, :only => :index

  protected
    def resource
      @document ||= params[:context_ids] ? Document.where(:context_id => params[:context_ids]).find(params[:id]) : super
    end
end
