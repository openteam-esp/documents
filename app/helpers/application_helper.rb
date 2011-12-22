module ApplicationHelper
  def is_active(item)
    'active' if controller_name.singularize == item
  end

  def search_label
    I18n.t("activerecord.attributes.paper_search.#{controller_name.singularize}_keywords")
  end
end
