require 'spec_helper'

describe Assertation do
  it { should belong_to(:objekt).class_name('Project') }
  it { should belong_to(:subject).class_name('Document') }

  it { should validate_presence_of :objekt }
  it { should validate_presence_of :subject }
end
