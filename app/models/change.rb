class Change < ActiveRecord::Base
  belongs_to :objekt,  :class_name => 'Document'
  belongs_to :subject, :class_name => 'Document'

  validates_presence_of :objekt, :subject
end
# == Schema Information
#
# Table name: changes
#
#  id         :integer         not null, primary key
#  subject_id :integer
#  objekt_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

