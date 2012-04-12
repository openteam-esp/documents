class DocumentSearch < Search
  column :context_ids,  :string
  column :keywords,     :text
end

# == Schema Information
#
# Table name: searches
#
#  context_ids :string
#  keywords    :text
#

