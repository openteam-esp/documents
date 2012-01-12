class Cancel < ActiveRecord::Base
  belongs_to :objekt,  :class_name => 'Document'
  belongs_to :subject, :class_name => 'Document'

  validates_presence_of :objekt, :subject

  after_create :set_objekt_state_to_canceled

  after_destroy :set_objekt_state_to_nil

  private
    def set_objekt_state_to_canceled
      objekt.update_attributes! :state => 'canceled'
    end

    def set_objekt_state_to_nil
      objekt.update_attributes! :state => nil
    end
end
