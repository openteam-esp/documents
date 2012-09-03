class Project < Paper
  has_many :assertations_for_project, :class_name => 'Assertation', :foreign_key => :objekt_id, :dependent => :destroy
  has_many :asserted_by, :through => :assertations_for_project, :source => :subject

  after_save :send_add_message, :if => :actual?

  default_scope order('published_on DESC')

  scope :by_state, ->(state) { where(:state => state) }

  has_enum :state,  %w[actual asserted deflected]
  has_enum :kind,   %w[decision direction order project]

  state_machine :initial => :actual do
    before_transition :deflected => :actual, :do => :reset_deflected_on

    after_transition any => :actual, :do => :send_add_message

    after_transition any => :deflected, :do => :send_remove_message

    after_transition any => :asserted, :do => :send_remove_message

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
    date    :published_on

    integer :context_ids, :multiple => true do |d| [d.context_id] end
    integer :object_id do |d| d.id end

    string  :state

    text    :title
    text    :context_title
  end

  def canceled?
    false
  end

  def cancels
    []
  end

  def assertations
    []
  end

  private
    def reset_deflected_on
      self.deflected_on = nil
    end
end

# == Schema Information
#
# Table name: papers
#
#  id           :integer         not null, primary key
#  kind         :string(255)
#  authority    :string(255)
#  title        :text
#  published_on :date
#  created_at   :datetime
#  updated_at   :datetime
#  number       :string(255)
#  approved_on  :date
#  type         :string(255)
#  state        :string(255)
#  deflected_on :date
#  file_url     :string(255)
#  context_id   :integer
#

