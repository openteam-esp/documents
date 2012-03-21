class ProjectSearch < Search
  column :context_id, :integer
  column :keywords,   :text
  column :state,      :string

  default_value_for :state, 'actual'
end

# == Schema Information
#
# Table name: searches
#
#  keywords :text
#  state    :string
#

