class Admin::AssertationsController < Admin::ApplicationController
  actions :create, :index

  belongs_to :subject, :class_name => 'Document', :param => :document_id, :route_name => :document
end
