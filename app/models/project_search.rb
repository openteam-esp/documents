class ProjectSearch < Search
  column :context_ids,  :string
  column :keywords,     :text
  column :order_by,     :string
  column :state,        :string

  default_value_for :order_by, 'published_on desc'
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

