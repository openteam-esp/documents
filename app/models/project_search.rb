class ProjectSearch < Search
  attr_accessible :keywords, :context_ids, :category_ids

  column :context_ids,  :string
  column :category_ids, :integer
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
#  order_by    :string
#  state       :string
#

