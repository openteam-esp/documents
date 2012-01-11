require 'spec_helper'

describe Paper do
  subject { Fabricate(:project) }

  it { should validate_presence_of :kind }
  it { should validate_presence_of :authority }
  it { should validate_presence_of :title }
  it { should validate_presence_of :published_on }

  it { should allow_value('decision').for(:kind) }
  it { should allow_value('direction').for(:kind) }
  it { should allow_value('order').for(:kind) }

  it { should_not allow_value('blablabla').for(:kind) }

  describe 'defalut values' do
    let(:document) { Fabricate(:document) }

    describe 'for published on' do
      it { document.published_on.should == Date.today }
    end
  end
end
