require 'spec_helper'

describe ProjectsController do
  let(:context) { Fabricate :context }

  let(:document) { Fabricate :document, :context => context }
  let(:project) { Fabricate :project, :context => context, :state => 'actual' }

  describe 'should return document by id' do
    before { get :show, :id => project.id, :format => 'json' } 
    
    specify { assigns(:project).should == project }
  end

  describe 'should return project by id and context ids' do
    before { get :show, :id => project.id, :format => 'json', :context_ids => [context.id] } 

    specify { assigns(:project).should == project }
  end

  describe 'should return 404 if project was not found' do
    specify { 
      expect { get :show, :id => project.id, :format => 'json', :context_ids => [888] }.to raise_exception(ActiveRecord::RecordNotFound)
    } 
  end
end
