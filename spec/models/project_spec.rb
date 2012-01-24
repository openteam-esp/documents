require 'spec_helper'

describe Project do
  subject { Fabricate :project }

  it { subject.class.scoped.to_sql.should == subject.class.order('published_on DESC').to_sql }

  it { Project.new.should be_actual }

  context 'should' do
    let(:project) { Fabricate :project }

    context 'validate deflected_on when fire to_deflected' do
      before do
        project.to_deflected
      end

      it { project.errors[:deflected_on].should_not be_empty }
    end

    context 'set deflected_on to nil when fire to_actual' do
      before do
        project.deflected_on = Date.today
        project.to_deflected

        project.to_actual
      end

      it { project.deflected_on.should be_nil }
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
#  file_url     :string(255)
#  deflected_on :date
#

