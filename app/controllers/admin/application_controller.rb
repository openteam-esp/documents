class Admin::ApplicationController < InheritedResourcesController
  before_filter proc { |controller| (controller.action_has_layout = false) if controller.request.xhr? }
end
