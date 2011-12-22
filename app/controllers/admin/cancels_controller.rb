class Admin::CancelsController < Admin::ApplicationController
  actions :create, :index

  belongs_to :subject, :class_name => 'Document', :param => :document_id, :route_name => :document

  def create
    create! { admin_document_cancels_path(resource.subject) }
  end
end
