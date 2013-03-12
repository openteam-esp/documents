class Manage::PermissionsController < Manage::ApplicationController
  belongs_to :user, :optional => true
  actions :new, :create, :destroy
  layout 'manage'

  def create
    create!{ manage_users_path }
  end

  def destroy
    destroy!{ manage_users_path }
  end

end
