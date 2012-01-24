class Admin::AssertationsController < Admin::ApplicationController
  actions :create, :destroy, :index

  belongs_to :subject, :class_name => 'Document', :param => :document_id

  def create
    create! { admin_document_assertations_path(@subject) }
  end

  def destroy
    destroy! { admin_document_assertations_path(@subject) }
  end
end
