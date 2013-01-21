# encoding: utf-8

User.find_or_initialize_by_uid('1').tap do | user |
  user.save(:validate => false)
  user.permissions.create! :context => Context.first, :role => :manager if user.permissions.empty?
end

Context.find(230).tap do |family_department|
  ["Отдых, оздоровление и занятость детей", "Опека и попечительство", "Помощь детям-сиротам"].each do |title|
    family_department.categories.find_or_create_by_title(title)
  end
end
