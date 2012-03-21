class ContextsController < InheritedResourcesController
  actions :index

  has_scope :with_papers, :default => 1

  respond_to :json
end
