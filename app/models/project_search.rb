class ProjectSearch < Search
  column :context_ids,  :string
  column :keywords,     :text
  column :state,        :string

  default_value_for :state, 'actual'
end

# == Schema Information
#
# Table name: searches
#
#  context_ids :string
#  keywords    :text
#  state       :string
#

