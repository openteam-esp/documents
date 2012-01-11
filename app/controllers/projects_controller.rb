class ProjectsController < InheritedResourcesController
  actions :index, :show

  has_scope :page, :default => 1, :only => :index

  has_scope :by_state, :default => 'actual'
end
