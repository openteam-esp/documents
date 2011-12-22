class ProjectsController < InheritedResourcesController
  actions :index, :show

  has_scope :page, :default => 1, :only => :index
end
