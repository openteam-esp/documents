module ApplicationHelper
  def is_active(item)
    'active' if controller_name.singularize == item
  end

  def search_label
    I18n.t("activerecord.attributes.paper_search.#{controller_name.singularize}_keywords")
  end

  def controller_namespace
    namespace = controller_path.match(/[a-z]+\//)
    return nil unless namespace
    namespace[0].match(/\w+/)[0].to_sym
  end
end
