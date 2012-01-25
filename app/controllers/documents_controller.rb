class DocumentsController < InheritedResourcesController
  actions :index, :show

  belongs_to :context, :optional => true

  has_scope :page, :default => 1, :only => :index
end
