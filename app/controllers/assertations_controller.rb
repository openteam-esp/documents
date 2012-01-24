class AssertationsController < InheritedResourcesController
  actions :index

  belongs_to :subject, :class_name => 'Document', :param => :document_id
end
