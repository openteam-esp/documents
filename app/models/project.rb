class Project < Paper
  validates_presence_of :state

  default_value_for :state, 'actual'

  has_enum :state, %w[actual asserted deflected]

  %w[actual deflected].each do |state|
    define_method("to_#{state}!") { p state; update_attributes!(:state => state) }
  end
end
