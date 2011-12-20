class Change < ActiveRecord::Base
  belongs_to :objekt, :class_name => 'Document'
  belongs_to :subject, :class_name => 'Document'

  validates_presence_of :objekt, :subject
end
