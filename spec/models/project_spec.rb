require 'spec_helper'

describe Project do
  subject { Fabricate(:project) }

  it { Project.new.should be_actual }

  describe 'should' do
    let(:project) { Fabricate(:project) }

    describe 'validate deflected_on when fire to_deflected' do
      before do
        project.to_deflected
      end

      it { project.errors[:deflected_on].should_not be_empty }
    end

    describe 'set deflected_on to nil when fire to_actual' do
      before do
        project.deflected_on = Date.today
        project.to_deflected

        project.to_actual
      end

      it { project.deflected_on.should be_nil }
    end
  end
end
