require 'spec_helper'

describe Cancel do
  it { should belong_to(:objekt).class_name('Document') }
  it { should belong_to(:subject).class_name('Document') }

  it { should validate_presence_of :objekt }
  it { should validate_presence_of :subject }

  describe 'documents' do
    let(:document) { Fabricate(:document) }
    let(:canceled_document) { Fabricate(:document) }

    before do
      document.cancels.create!(:objekt => canceled_document)
    end

    describe 'should be canceled' do
      it { canceled_document.should be_canceled }
    end

    describe 'should not be canceled' do
      before do
        document.cancels.first.destroy
      end

      it { canceled_document.reload.should_not be_canceled }
    end
  end
end
# == Schema Information
#
# Table name: cancels
#
#  id         :integer         not null, primary key
#  subject_id :integer
#  objekt_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

