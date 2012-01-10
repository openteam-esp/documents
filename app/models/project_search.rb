class ProjectSearch < Search
  column :keywords, :text
  column :state,    :string

  default_value_for :state, 'actual'
end
