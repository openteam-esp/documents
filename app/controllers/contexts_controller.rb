class ContextsController < InheritedResourcesController
  actions :index

  respond_to :json

  protected

    def collection
      @contexts = Context.with_papers.all
    end

end
