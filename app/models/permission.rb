class Permission < ActiveRecord::Base
  attr_accessible :context, :role, :context_id

  belongs_to :user

  validates_presence_of :context_id

  default_value_for :context_type, Context.model_name

  extend Enumerize
  enumerize :role, in: [:manager, :operator]

  sso_auth_permission roles: [:manager, :operator]
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

