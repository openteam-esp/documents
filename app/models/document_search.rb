class DocumentSearch < Search
  column :context_ids,  :string
  column :category_ids, :integer
  column :keywords,     :text
  column :order_by,     :string

  default_value_for :order_by, 'approved_on desc'
end

# == Schema Information
#
# Table name: searches
#
#  context_ids :string
#  keywords    :text
#  order_by    :string
#

