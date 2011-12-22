class Project < Paper
  validates_presence_of :state

  default_value_for :state, 'actual'

  has_enums
end
