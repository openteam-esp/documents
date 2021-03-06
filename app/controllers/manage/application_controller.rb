class Manage::ApplicationController < InheritedResourcesController
  sso_load_and_authorize_resource

  before_filter proc { |controller| (controller.action_has_layout = false) if controller.request.xhr? }
end
