require 'spec_helper'

describe Paper do
  subject { Fabricate :project }

  it { should validate_presence_of :kind }
  it { should validate_presence_of :context }
  it { should validate_presence_of :title }
  it { should validate_presence_of :published_on }

  it { should allow_value('decision').for(:kind) }
  it { should allow_value('direction').for(:kind) }
  it { should allow_value('order').for(:kind) }

  it { should_not allow_value('blablabla').for(:kind) }

  context 'defalut values' do
    let(:document) { Fabricate :document }

    describe 'for published on' do
      it { document.published_on.should == Date.today }
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

