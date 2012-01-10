class Project < Paper
  searchable do
    string :state
    text   :title
  end

  has_enum :state, %w[actual asserted deflected]

  state_machine :initial => :actual do
    event :to_actual do
      transition [:asserted, :deflected] => :actual
    end

    event :to_asserted do
      transition [:actual, :deflected] => :asserted
    end

    event :to_deflected do
      transition [:actual, :asserted] => :deflected
    end

    state :deflected do
      validates_presence_of :deflected_on
    end
  end
end
