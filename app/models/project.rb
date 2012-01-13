class Project < Paper
  default_scope order('published_on DESC')

  scope :by_state, ->(state) { where(:state => state) }

  has_enum :state, %w[actual asserted deflected]

  state_machine :initial => :actual do
    before_transition :deflected => :actual, :do => :reset_deflected_on

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

  searchable do
    string :state
    text   :title
  end

  def canceled?
    false
  end

  private
    def reset_deflected_on
      self.deflected_on = nil
    end
end
