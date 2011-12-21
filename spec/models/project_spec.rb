require 'spec_helper'

describe Project do
  subject { Fabricate(:project) }

  it { should validate_presence_of :state }
  it { Project.new.state.should == 'actual' }

  it { should allow_value('actual').for(:state) }
  it { should allow_value('asserted').for(:state) }
  it { should allow_value('deflected').for(:state) }

  it { should_not allow_value('blablabla').for(:state) }
end
