require 'spec_helper'

describe Assertation do
  it { should belong_to(:objekt).class_name('Project') }
  it { should belong_to(:subject).class_name('Document') }

  it { should validate_presence_of :objekt }
  it { should validate_presence_of :subject }

  describe 'after' do
    let(:document) { Fabricate(:document) }
    let(:project) { Fabricate(:project) }
    let(:assertation) { document.assertations_for_project.create(:objekt => project) }

    describe 'create should change state of project to asserted' do
      it { assertation.objekt.should be_state_asserted }
    end

    describe 'destroy should cnahge state of project to actual' do
      before do
        assertation.destroy
      end

      it { project.should be_state_actual }
    end
  end
end