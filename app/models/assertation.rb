class Assertation < ActiveRecord::Base
  belongs_to :objekt,  :class_name => 'Project'
  belongs_to :subject, :class_name => 'Document'

  validates_presence_of :objekt, :subject

  after_create :set_objekt_fire_to_asserted

  after_destroy :set_objekt_fire_to_actual

  private
    def set_objekt_fire_to_asserted
      objekt.to_asserted!
    end

    def set_objekt_fire_to_actual
      objekt.to_actual!
    end
end
