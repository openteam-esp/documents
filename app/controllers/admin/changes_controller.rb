class Admin::ChangesController < Admin::ApplicationController
  actions :create, :index

  belongs_to :subject, :class_name => 'Document', :param => :document_id

  def create
    create! { admin_document_changes_path(resource.subject) }
  end
end
