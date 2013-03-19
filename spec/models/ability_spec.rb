# encoding: utf-8

require 'spec_helper'
require 'sso-auth/spec_helper'

describe Ability do
  include SsoAuth::SpecHelper

  let(:root) { Fabricate :context }
  let(:child_1) { Fabricate :context, :parent => root }
  let(:child_1_1) { Fabricate :context, :parent => child_1 }
  let(:child_2) { Fabricate :context, :parent => root }

  def document(context)
    @document ||= Fabricate(:document, :context => context)
  end

  def project(context)
    @project ||= Fabricate(:project, :context => context)
  end

  context 'менеджер' do
    subject { ability_for(manager_of(child_1)) }

    context 'управление правами доступа' do
      it { should_not be_able_to(:manage, another_manager_of(root).permissions.first) }
      it { should     be_able_to(:manage, another_manager_of(child_1).permissions.first) }
      it { should     be_able_to(:manage, another_manager_of(child_1_1).permissions.first) }
      it { should_not be_able_to(:manage, another_manager_of(child_2).permissions.first) }
    end

    context 'управление документами' do
      it { should_not be_able_to(:manage, document(root)) }
      it { should     be_able_to(:manage, document(child_1)) }
      it { should     be_able_to(:manage, document(child_1_1)) }
      it { should_not be_able_to(:manage, document(child_2)) }
    end

    context 'управление проектами документов' do
      it { should_not be_able_to(:manage, project(root)) }
      it { should     be_able_to(:manage, project(child_1)) }
      it { should     be_able_to(:manage, project(child_1_1)) }
      it { should_not be_able_to(:manage, project(child_2)) }
    end
  end

  context 'оператор' do
    subject { ability_for(operator_of(child_1)) }

    context 'управление правами доступа' do
      it { should_not be_able_to(:manage, another_manager_of(root).permissions.first) }
      it { should_not be_able_to(:manage, another_manager_of(child_1).permissions.first) }
      it { should_not be_able_to(:manage, another_manager_of(child_1_1).permissions.first) }
      it { should_not be_able_to(:manage, another_manager_of(child_2).permissions.first) }
    end

    context 'управление документами' do
      it { should_not be_able_to(:manage, document(root)) }
      it { should     be_able_to(:manage, document(child_1)) }
      it { should     be_able_to(:manage, document(child_1_1)) }
      it { should_not be_able_to(:manage, document(child_2)) }
    end

    context 'управление проектами документов' do
      it { should_not be_able_to(:manage, project(root)) }
      it { should     be_able_to(:manage, project(child_1)) }
      it { should     be_able_to(:manage, project(child_1_1)) }
      it { should_not be_able_to(:manage, project(child_2)) }
    end
  end

end
