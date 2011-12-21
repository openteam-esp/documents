require 'spec_helper'

describe Document do
  it { should validate_presence_of :number }
  it { should validate_presence_of :approved_on }

  it { should have_many(:changes_for_documents).class_name('Change').dependent(:destroy) }
  it { should have_many(:changed_documents) }

  it { should have_many(:cancels_for_documents).class_name('Cancel').dependent(:destroy) }
  it { should have_many(:canceled_documents) }
end
