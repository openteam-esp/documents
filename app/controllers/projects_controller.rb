class ProjectsController < InheritedResourcesController
  actions :index, :show

  belongs_to :context, :optional => true

  has_scope :by_state, :default => 'actual'

  has_scope :page, :default => 1, :only => :index
end
