require 'spec_helper'

describe Project do
  let(:project) { Fabricate :project }

  it { project.class.scoped.to_sql.should == subject.class.order('published_on DESC').to_sql }

  it { Project.new.should be_actual }

  describe 'should validate deflected_on when fire to_deflected' do
    before do
      project.to_deflected
    end

    it { project.errors[:deflected_on].should_not be_empty }
  end

  describe 'should set deflected_on to nil when fire to_actual' do
    before do
      project.deflected_on = Date.today
      project.to_deflected

      project.to_actual
    end

    it { project.deflected_on.should be_nil }
  end

  describe 'should' do
    let(:message) {
      { 'context_id' => 3, 'id' => 888, 'kind' => 'project' }
    }

    before { Project.any_instance.stub(:id).and_return(888) }
    before { Project.any_instance.stub(:context_id).and_return(3) }

    describe 'be reindexed when' do
      describe 'it become actual' do
        before { project.update_attributes :deflected_on => Date.today }
        before { project.to_deflected }

        before { MessageMaker.should_receive(:make_message).with('esp.documents.cms', 'add', message) }

        it { project.to_actual }  
      end

      describe 'it become deflected' do
        before { project.update_attributes :deflected_on => Date.today }

        before { MessageMaker.should_receive(:make_message).with('esp.documents.cms', 'remove', message) }

        specify { project.to_deflected }
      end

      describe 'it become asserted' do
        before { MessageMaker.should_receive(:make_message).with('esp.documents.cms', 'remove', message) }

        specify { project.to_asserted }
      end

      describe 'it is actual and it is changed' do
        before { MessageMaker.should_receive(:make_message).with('esp.documents.cms', 'add', message) }

        specify { project.update_attributes :title => 'new title' }
      end
    end

    describe 'not be reindexed when' do
      describe 'it is asserted and it is changed' do
        before { project.to_asserted }

        before { MessageMaker.should_not_receive(:make_message) }
        
        specify { project.update_attributes :title => 'new title' }
      end
    end
  end
end

# == Schema Information
#
# Table name: papers
#
#  id           :integer         not null, primary key
#  kind         :string(255)
#  authority    :string(255)
#  title        :text
#  published_on :date
#  created_at   :datetime
#  updated_at   :datetime
#  number       :string(255)
#  approved_on  :date
#  type         :string(255)
#  state        :string(255)
#  deflected_on :date
#  file_url     :string(255)
#  context_id   :integer
#

