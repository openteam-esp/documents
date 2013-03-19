class User < ActiveRecord::Base
  sso_auth_user

  has_many :contexts, :through => :permissions, :source => :context, :source_type => 'Context', :uniq => true, :order => 'contexts.weight'

  searchable do
    integer :uid
    integer(:permissions_count) { permissions.count }

    text(:term) { [name, email, nickname].join(' ') }
  end

  def permissions_for(context)
    permissions.where(:context_id => context.path_ids)
  end

  def roles_for(context)
    permissions_for(context).map(&:role)
  end

  Permission.role.values.each do |role|
    define_method "#{role}_of?" do |context|
      roles_for(context).include?(role)
    end
  end

  def context_tree
    conditions = ["contexts.id IN (?)", "contexts.ancestry IN (?)"]
    conditions += contexts.map{"contexts.ancestry ILIKE ?"}
    Context.where(conditions.join(' OR '),
      contexts.map(&:id),
      contexts.map(&:child_ancestry),
      *contexts.map(&:subtree_condition))
  end
end

# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  uid                :string(255)
#  name               :text
#  email              :text
#  nickname           :text
#  first_name         :text
#  last_name          :text
#  location           :text
#  description        :text
#  image              :text
#  phone              :text
#  urls               :text
#  raw_info           :text
#  sign_in_count      :integer         default(0)
#  current_sign_in_at :datetime
#  last_sign_in_at    :datetime
#  current_sign_in_ip :string(255)
#  last_sign_in_ip    :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#

