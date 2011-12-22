class Project < Paper
  validates_presence_of :state

  default_value_for :state, 'actual'

  has_enum :state, %w[actual asserted deflected]

  def to_json
    as_json(:except => [:approved_on, :created_at, :id, :number, :updated_at])
  end
end
