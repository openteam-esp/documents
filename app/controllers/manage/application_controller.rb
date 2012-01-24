class Manage::ApplicationController < InheritedResourcesController

  before_filter :authenticate_user!

  before_filter proc { |controller| (controller.action_has_layout = false) if controller.request.xhr? }
end
