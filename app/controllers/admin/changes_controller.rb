class Admin::ChangesController < Admin::ApplicationController
  actions :create, :destroy, :index

  belongs_to :subject, :class_name => 'Document', :param => :document_id, :route_name => :document
end
