require 'spec_helper'

describe Change do
  it { should belong_to(:objekt).class_name('Document') }
  it { should belong_to(:subject).class_name('Document') }

  it { should validate_presence_of :objekt }
  it { should validate_presence_of :subject }
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

