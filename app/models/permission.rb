class Permission < ActiveRecord::Base
  attr_accessible :context, :role, :user_uid, :user_name, :user_email, :polymorphic_context, :user_search

  sso_auth_permission :roles => [:manager, :document_operator, :project_operator]
end

# == Schema Information
#
# Table name: permissions
#
#  id           :integer         not null, primary key
#  user_id      :integer
#  context_id   :integer
#  context_type :string(255)
#  role         :string(255)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

