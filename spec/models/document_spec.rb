# encoding: utf-8

require 'spec_helper'

describe Document do
  it { should validate_presence_of :number }
  it { should validate_presence_of :approved_on }

  it { should have_many(:assertations_for_project).class_name('Assertation').dependent(:destroy) }
  it { should have_many :asserted_projects }

  it { should have_many(:cancels_for_documents).class_name('Cancel').dependent(:destroy) }
  it { should have_many :canceled_documents }

  it { should have_many(:changes_for_documents).class_name('Change').dependent(:destroy) }
  it { should have_many :changed_documents }

  it { subject.class.scoped.to_sql.should == subject.class.order('approved_on DESC').to_sql }

  it "должен сохранять название органа власти" do
    document = Fabricate(:document, :context => Fabricate(:context, :title => 'Администрация ТО'))
    document.authority.should eql 'Администрация ТО'
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

