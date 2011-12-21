class Assertation < ActiveRecord::Base
  belongs_to :objekt, :class_name => 'Project'
  belongs_to :subject, :class_name => 'Document'

  validates_presence_of :objekt, :subject

  after_create :set_objekt_state_to_asserted

  after_destroy :set_objekt_state_to_actual

  private
    def set_objekt_state_to_asserted
      objekt.update_attribute(:state, 'asserted')
    end

    def set_objekt_state_to_actual
      objekt.update_attribute(:state, 'actual')
    end
end
