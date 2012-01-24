class Manage::CancelsController < Manage::ApplicationController
  actions :create, :destroy, :index

  belongs_to :subject, :class_name => 'Document', :param => :document_id

  def create
    create! { admin_document_cancels_path(@subject) }
  end

  def destroy
    destroy! { admin_document_cancels_path(@subject) }
  end
end
