require 'spec_helper'

describe Project do
  subject { Fabricate(:project) }

  it { Project.new.should be_actual }

  describe 'should validate deflected_on when fire to_deflected' do
    let(:project) { Fabricate(:project) }

    before do
      project.to_deflected
    end

    it { project.errors[:deflected_on].should_not be_empty }
  end
end
