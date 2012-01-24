class ContextsController < InheritedResourcesController
  actions :index
  respond_to :json
  has_scope :with_papers, :default => 1
end
