class Manage::AssertationsController < Manage::ApplicationController
  actions :create, :destroy, :index

  belongs_to :subject, :class_name => 'Document', :param => :document_id

  def create
    create! { manage_document_assertations_path(@subject) }
  end

  def destroy
    destroy! { manage_document_assertations_path(@subject) }
  end
end
