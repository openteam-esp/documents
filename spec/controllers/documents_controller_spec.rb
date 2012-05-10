require 'spec_helper'

describe DocumentsController do
  let(:context) { Fabricate :context }

  let(:document) { Fabricate :document, :context => context }
  let(:project) { Fabricate :document, :context => context }

  describe 'should return document by id' do
    before { get :show, :id => document.id, :format => 'json' } 
    
    specify { assigns(:document).should == document }
  end

  describe 'should return document by id and context ids' do
    before { get :show, :id => document.id, :format => 'json', :context_ids => [context.id] } 
     
    specify { assigns(:document).should == document }
  end

  describe 'should return 404 if document was not found' do
    specify { 
      expect { get :show, :id => document.id, :format => 'json', :context_ids => [888] }.to raise_exception(ActiveRecord::RecordNotFound)
    } 
  end
end
